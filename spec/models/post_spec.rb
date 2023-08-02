require 'rails_helper'

describe Post, type: :model do
  @user = User.create(
    name: 'Tom',
    photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
    bio: 'Teacher from Mexico.', posts_counter: 0
  )

  subject do
    Post.create(author: @user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                likes_counter: 0)
  end

  before { subject.save }

  it 'should have a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'should have an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end
end
