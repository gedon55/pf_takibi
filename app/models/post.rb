class Post < ApplicationRecord

  has_one_attached :image
  # optional: trueがないとuser_idがないエラーがみたいなのが
  belongs_to :user, optional: true
  
  validates :in_day, presence: true
  validates :out_day, presence: true
  validates :place, presence: true
  validates :member, presence: true
  validates :price, presence: true, numericality: {only_integer: true}
  validates :body, presence: true
  
  
end
