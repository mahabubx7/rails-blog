describe PostsController, type: :request do
  describe '#index' do
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

    it 'returns a successful response' do
      get '/users/1/posts'
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get '/users/1/posts'
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get '/users/1/posts'
      expect(response.body).to include('Here is a list of all posts for a given user')
    end
  end

  describe '#show' do
    it 'returns a successful response' do
      get '/users/1/posts/1'
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get '/users/1/posts/1'
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get '/users/1/posts/1'
      expect(response.body).to include('Here is a specific post for a single user')
    end
  end
end
