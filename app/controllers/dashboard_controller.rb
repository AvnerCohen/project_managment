class DashboardController < ApplicationController

	before_filter :verify_subdomain_ownership
	before_filter :verify_logged_in_user
	def index
	end
end
