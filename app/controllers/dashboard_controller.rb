class DashboardController < ApplicationController

	before_filter :verify_logged_in_user
	def index
	end
end
