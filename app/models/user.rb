# app/models/user.rb
class User < ApplicationRecord
  has_many :posts
  has_many :comments

  def most_recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end
end
