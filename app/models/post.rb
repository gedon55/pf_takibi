class Post < ApplicationRecord

  has_many_attached :images
  
  has_many :favorites, dependent: :destroy
  # optional: trueがないとuser_idがないエラーがみたいなのがでる
  belongs_to :user, optional: true

  # 公開非公開機能
  scope :published, -> {where(is_published_flag: true)}
  scope :unpublished, -> {where(is_published_flag: false)}
  
  # いいね機能（ログイン中のユーザーがその投稿に対していいねをしているか）
  def favorited?(user)
   favorites.where(user_id: user.id).exists?
  end

  validates :in_day, presence: true
  validates :out_day, presence: true
  validates :place, presence: true
  validates :member, presence: true
  validates :price, presence: true, numericality: {only_integer: true}
  validates :body, presence: true
  # validates :is_published_flag, presence: true


end
