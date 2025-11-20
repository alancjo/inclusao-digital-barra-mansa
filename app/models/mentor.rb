class Mentor < ApplicationRecord
  has_many :matches, dependent: :destroy
  has_many :students, through: :matches

  validates :full_name, :expertise, :contact_info, presence: true
  validates :contact_info, format: { with: URI::MailTo::EMAIL_REGEXP, message: "deve ser um email válido" }
end
