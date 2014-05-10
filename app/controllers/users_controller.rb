class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def index
    @user = User.all
  end
  def show
    if session[:current_user_id].nil?
      @user = User.find(params[:id])
    else
      @user = User.find(session[:current_user_id])
    end
  end
  def create
    if params[:login].nil?
      @user = User.new(user_params)
      @user.save
      set_session_user
      redirect_to @user
    else
      @user = User.new(user_params)
      if !params[:login].nil?
        if User.find_by username: params['username'] and User.find_by password: params['password']
          @user = User.find_by username: params['username']
          set_session_user
          render 'show'
        else
          render 'index'
        end
      end
    end
  end
  private
  def set_session_user
    session[:current_user_id] = @user.id
    session[:username] = @user.username
    session[:role] = @user.role
  end
  private
  def user_params
    if params[:login].nil?
      params.require(:user).permit(:username, :password, :role)
    end
  end
end
