require 'spec_helper'

describe Project do
  describe "Params" do
    it "should have a name" do
      project = Project.new
      project.should respond_to(:name)
    end

    it "should have a status" do
      project = Project.new
      project.should respond_to(:status)
    end
  end
  describe "Validations" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @valid_params = { name: Faker::Company.name, status: :active, user: @user }
    end

    it "should be saved with valid params" do
      project = Project.new(@valid_params)
      project.save.should be_true
    end
    it "should not save project with no name" do
      project = Project.new(@valid_params.merge({name: ''}))
      project.save.should be_false
    end

    it "should not save project with no status" do
      project = Project.new(@valid_params.merge({status: ''}))
      project.save.should be_false
    end
  end

  describe "Status" do
    before(:each) do
      @valid_params = { name: Faker::Company.name, status: :active }
    end


    it "should save the status correctly to the db" do
      project =Project.new(@valid_params)

      project.status.should eq(:active)

    end
  end


  describe "Associations" do

    it "should have a user" do
      project =Project.new
      project.should respond_to(:user)
    end

  end


end
