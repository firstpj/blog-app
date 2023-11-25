# app/models/user.rb

class User < ApplicationRecord
  has_many :posts

  def most_recent_posts
    posts.order(created_at: :desc).limit(5) # Adjust the order and limit as needed
  end
end
