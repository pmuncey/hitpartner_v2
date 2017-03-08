class Match < ApplicationRecord
  # Direct associations

  has_many   :messages,
             :dependent => :destroy

  belongs_to :hitpartner,
             :class_name => "User"

  belongs_to :player,
             :class_name => "User"

  # Indirect associations

  # Validations

end
