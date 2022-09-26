class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :groups, dependent: :destroy, through: :group_users
  has_many :owned_groups, class_name: "Group"
  has_many :items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com', last_name: 'ゲスト', first_name: 'ゲスト', nickname: 'ゲスト') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :nickname, presence: true, uniqueness: true
  
end