class RegistrationsController < ApplicationController
	def new
	
	end

	def create
	    user = User.new user_params
	    if user.save
	    	flash[:notice] = "Account Created"
	    	redirect_to root_path
	    else
	    	flash[:notice] = "Error in the creation"
	    	redirect_to registrations_url
	    end
	end

	def user_params
      		params.require(:registrations).permit(:name, :last_name, :email, :phone, :password)
    	end    
end
