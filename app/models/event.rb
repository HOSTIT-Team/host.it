class Event < ApplicationRecord
  belongs_to :user
  has_many :invitations, dependent: :destroy
  has_many :items, dependent: :destroy 
  validates :title, presence: true
  validates :time, presence: true
  validates :location, presence: true
  validates :description, presence:true
end
