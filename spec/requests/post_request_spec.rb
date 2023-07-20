require 'rails_helper'

RSpec.describe Post, type: :request do
  describe 'post controller' do
    it 'should render the post index' do
      get '/users/1/posts'

      expect(response).to have_http_status(:success)
      expect(response).to render_template('posts/index')
      expect(response.body).to include('username')
    end

    it 'should render the post show' do
      get '/users/1/posts/1'

      expect(response).to have_http_status(:success)
      expect(response).to render_template('posts/show')
      expect(response.body).to include('Post #1 by Username')
    end
  end
end