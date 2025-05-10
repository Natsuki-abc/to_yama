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

  # Ransackで検索可能な属性を定義
  def self.ransackable_attributes(auth_object = nil)
    # また全ての属性を許可
    column_names
  end

  # 関連付けを検索する場合は以下も追加
  def self.ransackable_associations(auth_object = nil)
    # 検索可能な関連付けをここに列挙
    # 例: ["routes", "climbs", "prefecture"
    reflect_on_all_associations.map { |a| a.name.to_s }
  end
end
