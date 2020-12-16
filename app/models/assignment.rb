class Assignment < ApplicationRecord
  validates :date, presence: true

  belongs_to :course
  has_many :assignment_sections

  accepts_nested_attributes_for :assignment_sections
end