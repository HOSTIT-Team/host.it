class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  has_many :invitations_as_sender, source: :invitations, foreign_key: :sender_id
  has_many :invitations_as_receiver, source: :invitations, foreign_key: :receiver_id
  has_many :events
  has_many :items
end
