class User < ApplicationRecord
<<<<<<< HEAD
=======
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
>>>>>>> 6640f6b7b802eb5598e9fb7de6d1b37490b95fd9
  has_many :posts, foreign_key: 'author_id'
  has_many :comment
  has_many :like, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
<<<<<<< HEAD

  validates :name, presence: true
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

=======

  # validates :name, presence: true
  # validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

>>>>>>> 6640f6b7b802eb5598e9fb7de6d1b37490b95fd9
  def three_recent_posts
    Post.where(author: self).order(created_at: :desc).first(3)
  end

  def update_posts_counter
    update(posts_counter: posts.count)
  end
end