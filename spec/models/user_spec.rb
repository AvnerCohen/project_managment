require 'spec_helper'

describe User do
  context "validations" do

  	it "should validate uniqueness of subdomain" do
  		@user = User.new(first_name: Faker::Name.first_name,
  			last_name: Faker::Name.last_name, 
  			password: "foobar", password_confirmation: "foobar",
  			email: Faker::Internet.email,
  			subdomain: "avner")
  		@user.save.should be_true

  		@user2 = User.new(first_name: Faker::Name.first_name,
  			last_name: Faker::Name.last_name, 
  			password: "foobar", password_confirmation: "foobar",
  			email: Faker::Internet.email,
  			subdomain: "avner")
  		@user2.save.should be_false		
  	end

  end
end
