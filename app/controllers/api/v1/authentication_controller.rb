class Api::V1::AuthenticationController < ApiController
  skip_before_action :authenticate_token!

  def create
    user = User.find_by(email: params[:email])
    if !user
      render json: { errors: ['Invalid email or password'] }
    elsif user.valid_password? params[:password]
      render json: { token: JsonWebToken.encode(sub: user.id) }
    else
      render json: { errors: ['Something went wrong!'] }
    end
  end
end
