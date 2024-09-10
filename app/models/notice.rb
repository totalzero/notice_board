class Notice < ApplicationRecord
  belongs_to :user
  belongs_to :category
end
