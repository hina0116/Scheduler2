class Diary < ApplicationRecord
  belongs_to :user

  validates :comment, presence: true

end
