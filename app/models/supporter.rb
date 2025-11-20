class Supporter < ApplicationRecord
  validates :name, :support_type, :contact_info, presence: true
  validates :contact_info, format: { with: URI::MailTo::EMAIL_REGEXP, message: "deve ser um email válido" }
end
