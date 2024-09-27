class User < ApplicationRecord
  belongs_to :department

  validates :name, presence: true
  validates :mail, format: { with: URI::MailTo::EMAIL_REGEXP, message: "invalid email format" }
end