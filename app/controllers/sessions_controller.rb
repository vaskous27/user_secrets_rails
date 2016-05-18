class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:email])

  	if 
  		user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to "/users"
  	else
  		flash[:errors] = "Invalid password/email combination"
  		redirect_to :back 
  	end
  end

  def destroy
  	session[:user_id] = nil
  	current_user = nil
  	redirect_to '/'
  end

end
