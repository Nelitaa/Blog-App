# class User < ApplicationRecord
#   # Include default devise modules. Others available are:
#   # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
#   devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :validatable, :confirmable
#   has_many :comments, foreign_key: 'author_id'
#   has_many :posts, foreign_key: 'author_id'
#   has_many :likes, foreign_key: 'author_id'
#   validates :name, presence: true, length: { maximum: 30 }
#   validates :bio, presence: true, length: { maximum: 100 }
#   validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
#   validates :posts_counter, numericality: { only_integer: true, less_than_or_equal_to: 100 }
#   validates :photo, presence: true, length: { maximum: 250 }

#   def latest_posts
#     posts.includes(:author).order(created_at: :desc).limit(3)
#   end
# end


class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # before_action :authenticate_user!
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable
  before_validation :set_default_values

  has_many :comments, class_name: 'Comment', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'author_id'
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'

  validates :name, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def latest_posts
    posts.includes(:author).order(created_at: :desc).limit(3)
  end

  private

  def set_default_values
    self.posts_counter ||= 0
  end
end
