class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :favorites, dependent: :destroy 
  has_many :favorite_posts, through: :favorites, source: :post 
  has_many :aruarus, dependent: :destroy
  has_many :aruaru_posts, through: :aruarus, source: :post
  has_many :nainais, dependent: :destroy
  has_many :nainai_posts, through: :nainais, source: :post

  def aruaru?(post_id, user_id)
    Aruaru.find_by(post_id: post_id, user_id: user_id)
  end
  
  def nainai?(post_id, user_id)
    Nainai.find_by(post_id: post_id, user_id: user_id)
  end
end
