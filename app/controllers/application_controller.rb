class ApplicationController < ActionController::Base
	protect_from_forgery

	def verify_logged_in_user
		unless current_user
			flash[:error] = "You are not logged in"
			redirect_to user_session_url
		end
	end
	def after_sign_in_path_for(resource)
		if resource.is_a? User
			return root_url(subdomain: resource.subdomain)
		else
			super
		end
	end
end
