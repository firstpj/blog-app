require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    user1 = User.create(name: 'Akorda Collins', photo_link: 'Akorda.jpeg',
                        bio: 'Software developer, Hardware and network technician', posts_counter: 0)
    user2 = User.create(name: 'Doris Markus', photo_link: 'Doris.jpeg',
                        bio: 'She enjoys creating henna designs and having a good time.', posts_counter: 0)
    post = Post.create(title: 'title', text: ' A Journey into the World of Creative Expression',
                       author: user1, likes_counter: 3, comments_counter: 7)
    comment = Comment.create(post:, user: user2, text: 'serina is a good girl')

    it 'increase comments count on the post' do
      expect do
        comment.update_comment_count
        post.reload
      end.to change(post, :comments_counter).by(1)
    end
    it 'is valid with a user and a post' do
      user = User.create(name: 'Tom', post_counter: 0)
      post = user.posts.create(title: 'My Post', comments_counter: 0, likes_counter: 0)
      comment = post.comments.new(user:, text: 'Nice post!')
      expect(comment).to be_valid
    end

    it 'is not valid without a user' do
      post = Post.create(author: User.new, title: 'My Post', comments_counter: 0, likes_counter: 0)
      comment = post.comments.new(user: nil, text: 'Nice post!')
      comment.valid?
      expect(comment.errors[:user]).to include('must exist')
    end

    it 'is not valid without text' do
      user = User.create(name: 'Tom', post_counter: 0)
      post = user.posts.create(title: 'My Post', comments_counter: 0, likes_counter: 0)
      comment = post.comments.new(user:, text: nil)
      comment.valid?
      expect(comment.errors[:text]).to include("can't be blank")
    end

    it 'updates the comments counter for a post' do
      user = User.create(name: 'Tom', post_counter: 1)
      post = user.posts.create(title: 'My Post', comments_counter: 0, likes_counter: 0)
      comment = post.comments.create(user:, text: 'Nice post!')
      comment.increment_post_comments_counter
      post.reload
      expect(post.comments_counter).to eq(2)
    end
  end
end
