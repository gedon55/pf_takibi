class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, dependent: :destroy, through: :group_users
  has_many :active_users, -> {where("group_users.status = 1")}, through: :group_users, source: :user

  belongs_to :user

  validates :name, presence: true
  validates :introduction, presence: true
  validates :status, presence: true
  # attachment :image, destroy: false
  has_one_attached :image

  # 中間テーブルからuser_idを取ってくる
  def group_user(user)
    group_users.find_by(user_id: user.id)
  end

end