class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :groups, dependent: :destroy, through: :group_users
  has_many :owned_groups, class_name: "Group"
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :nickname, presence: true
end