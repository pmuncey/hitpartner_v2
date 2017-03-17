class Message < ApplicationRecord
  # Direct associations

  belongs_to :match

  belongs_to :user

  # Indirect associations

  # Validations
  validates :body, presence: true
end
