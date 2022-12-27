class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags, dependent: :destroy
  has_many :comments
  has_many :favorites, dependent: :destroy 
  has_many :users, through: :favorites
end
