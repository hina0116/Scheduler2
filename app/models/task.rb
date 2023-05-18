class Task < ApplicationRecord
  # has_one_attached :image
  belongs_to :user

  validates :name, presence: true
  validates :content, presence: true

end
