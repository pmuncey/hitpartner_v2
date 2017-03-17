class Match < ApplicationRecord
  # Direct associations

  belongs_to :court

  has_many   :messages,
             :dependent => :destroy

  belongs_to :hitpartner,
             :class_name => "User"

  belongs_to :player,
             :class_name => "User"

  # Indirect associations

  # Validations

  validates :player_id, :hitpartner_id, :court_id, presence: true

  # validates :player_id, uniqueness: {scope: [:hitpartner_id, :court_id] }

end
