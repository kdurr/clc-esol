class AssignmentSection < ApplicationRecord
  validates :instructions, presence: true

  belongs_to :assignment
end