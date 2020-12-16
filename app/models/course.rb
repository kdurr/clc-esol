class Course < ApplicationRecord
  validates :name, presence: true
  validates :active, presence: true

  has_many :assignments

  scope :is_active, -> { where(active: true) }
end