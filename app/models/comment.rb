class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :text, presence: true

  before_destroy -> { Post.find_by(id: post_id).decrement!(:comments_counter) }

  after_save do
    post = Post.find_by(id: post_id)
    post.increment!(:comments_counter)
  end
end
