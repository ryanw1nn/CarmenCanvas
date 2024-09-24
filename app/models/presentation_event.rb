class PresentationEvent < ApplicationRecord
  has_and_belongs_to_many :users, dependent: :destroy
  has_many :evaluations, dependent: :destroy
end
