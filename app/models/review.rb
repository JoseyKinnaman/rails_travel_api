class Review < ApplicationRecord
  validates :author, presence: true
  validates :content, presence: true
  validates :place, presence: true
end