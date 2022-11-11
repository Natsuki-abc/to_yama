class Mountain < ApplicationRecord
  validates :mountain_name, presence: true, length: { maximum: 50 }
  validates :address, presence: true, uniqueness: true
  validates :time, presence: true
  validates :elevation, presence: true, numericality: true
  validates :difficulty, presence: true
  validates :station, presence: true
  validates :season, presence: true
  validates :parking, presence: true
  validates :distance, presence: true, numericality: truezs  
end
