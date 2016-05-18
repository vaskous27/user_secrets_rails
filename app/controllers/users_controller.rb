class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	user = User.new(user_params)

  	if user.save
  		redirect_to :root
  	else
  		flash[:errors] = user.errors.full_messages
  		redirect_to :back
  	end
  end

  def edit
    @edit_user = User.find(params[:id])
  end

  def update
     User.find(params[:id]).update(user_params)
    redirect_to '/users'
  end

   def destroy
    User.find(params[:id]).destroy
    session[:user_id] = nil
    redirect_to '/'
  end

 private
   def user_params
   	params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end
  
end
