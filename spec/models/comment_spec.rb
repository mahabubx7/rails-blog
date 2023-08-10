require 'rails_helper'

describe Like, type: :model do
  describe ' #update_post_comments_counter' do
    it 'should belong to an author' do
      comment = Comment.reflect_on_association('author')
      expect(comment.macro).to eq(:belongs_to)
    end

    it 'should belong to a post' do
      comment = Comment.reflect_on_association('post')
      expect(comment.macro).to eq(:belongs_to)
    end

    it 'updates comments counter of the post' do
      user1 = User.create(
        name: 'Tom',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Mexico.', posts_counter: 0
      )
      post1 = Post.create(author: user1, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                          likes_counter: 0)
      Comment.create(post: post1, author: user1, text: 'Hi Tom!')
      commented_post = Post.find_by_author_id(post1.author_id)
      expect(commented_post.comments_counter).to eq 1
    end
  end
end
