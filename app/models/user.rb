class User < ApplicationRecord
  has_secure_password
  has_many :notices
  validates :email, presence: true, length: {minimum: 3}, uniqueness: true

def admin?
  self.admin
end
end
