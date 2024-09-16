class Notice < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :title, presence: true, length: {minimum: 3}
  validates :body, presence: true, length: {minimum: 12}
end
