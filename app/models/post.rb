class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags, dependent: :destroy
  has_many :comments
  has_many :favorites, dependent: :destroy 
  has_many :users, through: :favorites
  has_many :aruarus, dependent: :destroy
  has_many :aruaru_users, through: :aruarus, source: :user
  has_many :nainais, dependent: :destroy
  has_many :nainai_users, through: :nainais, source: :user
end
