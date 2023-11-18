class Post < ApplicationRecord
<<<<<<< HEAD
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  belongs_to :author, class_name: 'User'
  belongs_to :user, foreign_key: 'author_id'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :increment_post_counter
  before_validation :initialize_counters

  def create_like(user)
    likes.create(user:)
  end

=======
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes
  after_save :update_post_counter

>>>>>>> 6640f6b7b802eb5598e9fb7de6d1b37490b95fd9
  def five_recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end

<<<<<<< HEAD
  def increment_post_counter
    puts 'Incrementing posts counter'
    author.increment!(:posts_counter)
  end

  def all_posts
    Comment.where(post_id: id).order(created_at: :desc)
  end

  def all_comments
    comments.order(created_at: :desc)
  end

  private

  def initialize_counters
    self.comments_counter ||= 0
    self.likes_counter ||= 0
  end
end
=======
  def update_post_counter
    author.increment!(:posts_counter)
  end

  def all_comments
    Comment.where(post_id: id)
  end

  # Add validations

  # Title must not be blank.
  validates :title, presence: true

  # Title must not exceed 250 characters.
  validates :title, length: { maximum: 250 }

  # CommentsCounter must be an integer greater than or equal to zero.
  validates :comments_counter, numericality: { allow_nil: true, only_integer: true, greater_than_or_equal_to: 0 }

  # LikesCounter must be an integer greater than or equal to zero.
  validates :likes_counter, numericality: { allow_nil: true, only_integer: true, greater_than_or_equal_to: 0 }
end
>>>>>>> 6640f6b7b802eb5598e9fb7de6d1b37490b95fd9
