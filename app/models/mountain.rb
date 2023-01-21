class Mountain < ApplicationRecord
  mount_uploader :mountain_image, MountainImageUploader

  validates :mountain_name, presence: true, length: { maximum: 50 }
  validates :address, presence: true
  validates :time, presence: true
  validates :elevation, presence: true, numericality: true
  validates :difficulty, presence: true
  validates :station, presence: true
  validates :season, presence: true
  validates :parking, presence: true
  validates :distance, presence: true, numericality: true
  validates :furigana, presence: true
  validates :area, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
