require 'rails_helper'

RSpec.describe LikesController, type: :controller do

	before do
		@user = create_user
		@secret = @user.secrets.create(content: "secret")
		@like = @secret.likes.create(user_id: @user)
	end

	describe "when not logged in" do
		before do
      session[:user_id] = nil
    end
    it "cannot access, likes" do
      post :create
      expect(response).to redirect_to('/sessions/new')
    end 
    it "cannot access, likes" do
      delete :destroy
      expect(response).to redirect_to('/sessions/new')
    end 
	end
	

	 describe "when signed in as the wrong user" do
		 	 before do
	      @wrong_user = create_user 'julius', 'julius@lakers.com'
	      session[:user_id] = @wrong_user.id
	    end
	    it "cannot access destroy" do
	      visit '/secrets'
	      expect(page).not_to have_button('Unlike')
	    end
   
     end 



end




