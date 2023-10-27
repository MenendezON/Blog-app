require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'John Doe', photo: 'photo', bio: 'bio') }
  let(:post) { Post.create(title: 'title', text: 'text', author_id: user) }

  let(:comment) { Comment.new(text: 'text', post_id: post.id, author_id: user.id) }

  before { comment.save }

  it 'is valid with valid attributes' do
    expect(comment).to_not be_valid
  end
end
