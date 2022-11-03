class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments

  def aruaru?(post_id, user_id)
    Aruaru.find_by(post_id: post_id, user_id: user_id)
  end
  
  def nainai?(post_id, user_id)
    Nainai.find_by(post_id: post_id, user_id: user_id)
  end
end
