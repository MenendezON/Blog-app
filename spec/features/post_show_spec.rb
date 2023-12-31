require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  describe 'Post show page' do
    before(:each) do
      @user = User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Life science',
                          posts_counter: 0)
      @user.save
      @postone = Post.create(title: 'something', text: 'hello', user: @user, comments_counter: 0, likes_counter: 0)
      @posttwo = Post.create(title: 'cool', text: 'world', user: @user, comments_counter: 0, likes_counter: 0)
      @comment1 = Comment.create(text: 'hello world', user: @user, post: @postone)
      @comment2 = Comment.create(text: 'this is amazing', user: @user, post: @postone)
      @likeone = Like.new(user: @user, post: @postone)
      @liketwo = Like.new(user: @user, post: @posttwo)
    end

    it 'show post title' do
      visit user_posts_path(@user.id)
      expect(page).to have_content(@postone.title)
    end

    it 'should show who wrote the post' do
      visit user_posts_path(@user.id)
      expect(page).to have_content(@postone.user.name)
    end

    it 'show how many comment post has' do
      visit user_posts_path(@user.id)
      expect(page).to have_content(@postone.comments_counter)
    end

    it 'show how many likes post has' do
      visit user_posts_path(@user.id)
      expect(page).to have_content(@postone.likes_counter)
    end

    it 'should show post body' do
      visit user_posts_path(@user.id)
      expect(page).to have_content(@postone.text)
    end

    it 'should show username of each commenter' do
      visit user_posts_path(@user.id)
      expect(page).to have_content(@comment1.user.name)
      expect(page).to have_content(@comment2.user.name)
    end

    it 'shows the comment of each commenter' do
      visit user_posts_path(@user.id)
      expect(page).to have_content(@comment1.text)
      expect(page).to have_content(@comment2.text)
    end
  end
end
