class Event < ApplicationRecord
  belongs_to :user
  has_many :invitations, dependent: :destroy
  has_many :items, dependent: :destroy 

  validates :title, presence: true
  validates :scheduled_at, presence: true
  validates :location, presence: true
  validates :description, presence:true

  has_one_attached :banner

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def will_save_change_to_location?
    location_changed?
  end
end
