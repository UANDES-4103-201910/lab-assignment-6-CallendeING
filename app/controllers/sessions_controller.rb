class SessionsController < ApplicationController
	def new
	end

	def create
	    user = User.find_by(email: creation_params[:email])
	    if user.password==creation_params[:password] && user
	      	flash[:notice] = 'You are logged in'
	      	redirect_to user_path(user)
	    else
	      	flash[:notice] = 'Error, please verify the data'
	      	redirect_to root_path
	    end
	end

	def destroy
		@_current_user = session[:current_user_id] = nil
		redirect_to root_url
  	end

  	def creation_params
    		params.require(:session).permit(:email, :password)
	end
end
