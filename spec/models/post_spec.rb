require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid with a title and valid counters' do
    post = Post.new(title: 'Example Title', comments_counter: 0, likes_counter: 0)
    expect(post).to_not be_valid
  end

  it 'is invalid without a title' do
    post = Post.new(comments_counter: 0, likes_counter: 0)
    expect(post).to_not be_valid
  end

  it 'is invalid with a too long title' do
    post = Post.new(title: 'A' * 251, comments_counter: 0, likes_counter: 0)
    expect(post).to_not be_valid
  end

  it 'is invalid with negative comments counter' do
    post = Post.new(title: 'Example Title', comments_counter: -1, likes_counter: 0)
    expect(post).to_not be_valid
  end

  it 'is invalid with negative likes counter' do
    post = Post.new(title: 'Example Title', comments_counter: 0, likes_counter: -1)
    expect(post).to_not be_valid
  end
end
