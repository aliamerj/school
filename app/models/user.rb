class User < ApplicationRecord
  has_secure_password

  attr_accessor :current_password

  validates :name, presence: true,
                   length: { maximum: 30, minimum: 4 },
                   format: { with: /\A[a-zA-Z]+\z/ }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 50 },
                    confirmation: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  validates :password, presence: true,
                       length: { maximum: 30, minimum: 4 },
                       confirmation: true,
                       on: :create
  validates :password_confirmation, presence: true, if: -> { password_digest.blank? }

  validates :age, presence: true,
                  format: { with: /\A[+-]?\d+\z/ }
  validates :current_password, presence: true, on: :update
  validate :current_password_matches, on: :update, if: -> { password.present? }

  before_save :encrypt_password

  def self.authenticate(email, password)
    user = find_by(email: email)
    return user if BCrypt::Password.new(user.password_digest).is_password?(password)
  end

  def current_password_matches
    unless authenticate(current_password)
      errors.add(:current_password, "is incorrect")
    end
  end

  private

  def encrypt_password
    self.password_digest = BCrypt::Password.create(password)
  end
end
