class User < ApplicationRecord
  # Direct associations

  has_many   :player_matches,
             :class_name => "Match",
             :foreign_key => "player_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
