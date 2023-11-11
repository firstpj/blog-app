require 'rails_helper'
RSpec.describe Like, type: :model do
  describe 'Like model' do
    it 'should increase likes count on the post' do
      user1 = User.create(name: 'Akorda Collins', photo_link: 'Akorda.jpeg',
                          bio: 'Software developer, Hardware and network technician', posts_counter: 0)
      user2 = User.create(name: 'Doris Markus', photo_link: 'Doris.jpeg',
                          bio: 'she loves to design henna and have fun', posts_counter: 0)
      post = Post.create(title: 'MoonLight', text: 'I love moonlight serenity', author: user1, likes_counter: 5,
                         comments_counter: 2)
      like = Like.create(post:, user: user2)

      expect do
        like.increment_likes_counter
        post.reload
      end.to change(post, :likes_counter).by(1)
    end
  it 'is valid with a user and a post' do
    user = User.create(name: 'John', post_counter: 0)
    post = user.posts.create(title: 'My Post', comments_counter: 0, likes_counter: 0)
    like = post.likes.new(user:)
    expect(like).to be_valid
  end

  it 'is not valid without a user' do
    post = Post.create(author: User.new, title: 'My Post', comments_counter: 0, likes_counter: 0)
    like = post.likes.new(user: nil)
    like.valid?
    expect(like.errors[:user]).to include('must exist')
  end

  it 'updates the likes counter for a post' do
    user = User.create(name: 'John', post_counter: 1)
    post = user.posts.create(title: 'My Post', comments_counter: 0, likes_counter: 0)
    like = post.likes.create(user:)
    like.increment_post_likes_counter
    post.reload
    expect(post.likes_counter).to eq(2)
  end
end
