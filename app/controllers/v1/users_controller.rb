class V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users.to_json(only: [:id, :first_name, :last_name])
  end

  # GET /users/1
  def show
    render json: payload(@user)
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params[:user][:password_hash] = params[:password]
      params.require(:user).permit(:first_name, :last_name, :email, :password_hash)
    end

    def payload(user)
      return nil unless user and user.id
      {
        user: {
          id: user.id,
          first_name: user.first_name,
          last_name: user.last_name,
          isAuthenticated: true
        }
      }
    end
end
