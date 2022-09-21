class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, dependent: :destroy, through: :group_users

  belongs_to :user

  validates :name, presence: true
  validates :introduction, presence: true
  # attachment :image, destroy: false
  has_one_attached :image
end