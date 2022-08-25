class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable    
  
  has_many :events, foreign_key: "host_id", dependent: :destroy

  has_many :attendances, foreign_key: "attendee_id", dependent: :destroy
  has_many :attended_events, through: :attendances

  has_many :invites, foreign_key: "inviting_id", 
    inverse_of: :inviting, dependent: :destroy
  has_many :invited, through: :invites

  has_many :invites_received, foreign_key: "invited_id",
            class_name: "Invite", inverse_of: :invited, dependent: :destroy
  has_many :inviting, through: :invites_sent

  validates :name, presence: true
  validates :password, presence: true
  validates :email, presence: true

  scope :all_except, ->(user_id) { where.not(id: user_id) }
end
