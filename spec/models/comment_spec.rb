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
  end
end
