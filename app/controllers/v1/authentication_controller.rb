class V1::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request!

  def login
    user = User.find_by(email: params[:email])
    if user && user.valid_password?(params[:password])
      render json: payload(user)
    else
      render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
    end
  end

  private

  def payload(user)
    return nil unless user and user.id
    {
      token: JsonWebToken.encode({user_id: user.id, exp: Time.now.to_i + 24.hours.to_i}),
      user: {
        id: user.id,
        first_name: user.first_name,
        last_name: user.last_name,
        isAuthenticated: true
      }
    }
  end
end