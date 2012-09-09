require 'spec_helper'

describe DashboardController do
	render_views
	include Devise::TestHelpers



	context "User is signed out" do
		before(:each) do
			@request.host = "avner.manage.local"
			@request.env["HTTP_REFERER"] = @request.host
		end
		it "should be redirected" do
			get :index
			response.should be_redirect
		end
	end
	context "User is signed in" do
		before (:each) do
			@user = FactoryGirl.create(:user, subdomain: "avner")

			sign_in  @user
			@request.host = "avner.manage.local"
			@request.env["HTTP_REFERER"] = @request.host

		end

		describe "When user is subdomain owner" do

			it "should allow user to enter" do
				get :index
				response.should be_success
			end


		end

		describe "When user is not subdomain owner" do
			before (:each) do
				@not_owner = FactoryGirl.create(:user, subdomain: "avner2")

				sign_in  @not_owner
				@request.host = "avner.manage.local"
				@request.env["HTTP_REFERER"] = @request.host

			end
			it "Should redirect to login page" do
				get :index
				response.should be_redirect
			end
		end
	end
end
