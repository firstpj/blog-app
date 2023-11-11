class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :increment_likes_counter, on: :create

  def increment_likes_counter
    post.increment!(:likes_counter)
  end
end
