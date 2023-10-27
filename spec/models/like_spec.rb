require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'John Doe', photo: 'photo', bio: 'bio') }
  let(:post) { Post.create(title: 'title', text: 'text', author: user) }

  let(:like) { Like.new(post_id: post.id, author_id: user.id) }
  before { like.save }

  it 'is valid with valid attributes' do
    expect(like).to_not be_valid
  end
end
