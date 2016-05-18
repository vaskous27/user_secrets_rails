class LikesController < ApplicationController
  before_action :require_login, only: [:create, :destroy]
  # before_action :require_correct_user, only: [:create, :destroy]

  def create
  	@secret = Secret.find(params[:id])
  	if @secret.likes.count == 0
	  	@like = Like.new(user_id: current_user.id, secret_id: params[:id] )
	  	if @like.save
	  	redirect_to "/secrets"
	    end
  	else
  		redirect_to "/secrets"
  	end
  end

  def destroy
  	Like.find_by(user_id: current_user.id).destroy
  	redirect_to "/secrets"
  end
end
