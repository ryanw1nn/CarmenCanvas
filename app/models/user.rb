class User < ApplicationRecord
  has_and_belongs_to_many :presentation_events
  has_many :evaluations, dependent: :destroy
  has_secure_password

  validates :name, presence: true, uniqueness: true
  # utilizes REGEX to validate passwords and display messages if non-compliant
  validates :password, presence: true, length: { minimum: 8 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()\-_=+\\\|\[\]{};:'",.<>\/?]).{8,}\z/, message: "must include at least one letter, one number, and one special character" }
  
end
