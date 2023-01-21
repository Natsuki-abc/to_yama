class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :icon, IconUploader

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i.freeze
  VALID_PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*\d)[a-z\d]{8,}+\z/.freeze
  validates :name, presence: true, length: { in: 1..10 }
  validates :email, uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX, message: 'を○○@○○.○○の形式で入力して下さい' },
                    length: { maximum: 255 }
  validates :password, presence: true,
                       on: :create,
                       confirmation: true,
                       length: { maximum: 75 },
                       format: { with: VALID_PASSWORD_REGEX, message: 'を半角英数字8文字以上で入力して下さい' }

  def self.guest
    find_or_create_by!(name: 'ゲストユーザー', email: 'guest@example.com') do |user|
      user.password = SecureRandom.hex(10)
    end
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_mountains, through: :favorites, source: :mountain

  # お気に入り関連のインスタンスメソッド
  # お気に入りを登録する
  def favorite(mountain)
    favorite_mountains << mountain
  end

  #  お気に入りを解除する
  def unfavorite(mountain)
    favorite_mountains.destroy(mountain)
  end

  # お気に入りしているかどうかを判定する
  def favorites?(mountain)
    favorites.where(mountain_id: mountain.id).exists?
  end
end
