class Category < ApplicationRecord
  has_many :notices
  validates :name, presence: true, length: {minimum: 3}
  validates :description, presence: true, length: {minimum:5}
end
