class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  after_create :update_user_posts_count

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_user_posts_count
    post_count = author.posts.count
    author.update(posts_count: post_count)
  end
end
