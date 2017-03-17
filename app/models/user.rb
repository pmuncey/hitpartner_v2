class User < ApplicationRecord
  # Direct associations

  has_many   :messages,
             :dependent => :destroy

  has_many   :hitpartner_matches,
             :class_name => "Match",
             :foreign_key => "hitpartner_id",
             :dependent => :destroy

  has_many   :player_matches,
             :class_name => "Match",
             :foreign_key => "player_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :players,
             :through => :hitpartner_matches,
             :source => :player

  has_many   :hitpartners,
             :through => :player_matches,
             :source => :hitpartner

  # Validations

  validates :name, presence: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
