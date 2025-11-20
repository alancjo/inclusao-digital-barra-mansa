class Student < ApplicationRecord
  has_many :matches, dependent: :destroy
  has_many :mentors, through: :matches

  validates :full_name, :interests, :learning_goal, :contact_info, presence: true
  validates :contact_info, format: { with: URI::MailTo::EMAIL_REGEXP, message: "deve ser um email válido" }

  def interests_tokens
    interests.to_s.downcase.split(/[,;]+/).map(&:strip).reject(&:blank?)
  end
end
