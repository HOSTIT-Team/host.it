class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :invitations_as_sender, source: :invitations, foreign_key: :sender_id
  has_many :invitations_as_receiver, source: :invitations, foreign_key: :receiver_id
  has_many :events
  has_many :items

  has_one_attached :avatar
end
