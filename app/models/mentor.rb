class Mentor < ApplicationRecord
  validates :full_name, :expertise, :contact_info, presence: true
  validates :contact_info, format: { with: URI::MailTo::EMAIL_REGEXP, message: "deve ser um email válido" }
end
