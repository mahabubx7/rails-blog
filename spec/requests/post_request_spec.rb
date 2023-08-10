describe PostsController, type: :request do
  describe '#index' do
    before do
      @user = User.create(name: 'Mahabub',
                          photo: 'https://unsplash.com/photos/man-person-standing-between-tall-trees-F_-0BxGuVvo',
                          bio: 'Software developer', posts_counter: 0)
      @post = Post.create(title: 'post 1', text: 'First post', comments_counter: 0, likes_counter: 0, author: @user)
    end

    it 'should render the post index' do
      get "/users/#{@user.id}/posts"

      expect(response).to have_http_status(:success)
      expect(response).to render_template('posts/index')
      expect(response.body).to include("Post ##{@post.id}")
    end
  end

  describe '#show' do
    before do
      @user = User.create(name: 'Mahabub',
                          photo: 'https://unsplash.com/photos/man-person-standing-between-tall-trees-F_-0BxGuVvo',
                          bio: 'Software developer', posts_counter: 0)
      @post = Post.create(title: 'post 1', text: 'First post', comments_counter: 0, likes_counter: 0, author: @user)
    end

    it 'returns a successful response' do
      get "/users/#{@user.id}/posts/#{@post.id}"
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get "/users/#{@user.id}/posts/#{@post.id}"
      expect(response).to render_template(:show)
    end

    it 'should render the post show' do
      get "/users/#{@user.id}/posts/#{@post.id}"

      expect(response).to have_http_status(:success)
      expect(response).to render_template('posts/show')
      expect(response.body).to include(@post.text)
    end
  end
end
