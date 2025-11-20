class Match < ApplicationRecord
  belongs_to :student
  belongs_to :mentor

  validates :score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :status, presence: true, inclusion: { in: %w[pending accepted rejected] }
  validates :student_id, uniqueness: { scope: :mentor_id, message: "já possui conexão com este mentor" }

  scope :pending, -> { where(status: "pending") }
  scope :accepted, -> { where(status: "accepted") }
  scope :rejected, -> { where(status: "rejected") }
end
