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
end
