class UsersController < ApplicationController
  before_action :find_user, only:[:show, :update, :destroy]
  before_action :authorize_user, except: [:index]

  def index
    @users = User.all
    render json: @users, status: 200
  end


  def show
    render json: @user, status: 200
  end

  def update
    if @user.update(user_params)
        render json: @user, status: 200
    else
        render json: {message: "User cannot be updated", error: @user.errors.full_messages}, status: 200
    end
  end
  def destroy
    @user.destroy
    render json: {message: "Record destroyed Successfully"}
  end

  

  private
  def find_user
    @user=User.find(params[:id])
  end

  def authorize_user
    unless authorize @user
        flash[:alert]= "You are not authorized to perform this action"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end