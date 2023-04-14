class User < ApplicationRecord
  validates :name, presence: true,
                   length: { maximum: 30, minimum: 4 },
                   format: { with: /\A[a-zA-Z]+\z/ }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 50 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :email, confirmation: { case_sensitive: false }
  validates :password, presence: true, length: { maximum: 30, minimum: 4 }

  validates :age, presence: true,
                  format: { with: /\A[+-]?\d+\z/ }
end
