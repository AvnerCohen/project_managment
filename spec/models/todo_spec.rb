require 'spec_helper'

describe Todo do
  before(:each) do
    @user =  FactoryGirl.create(:user)
    @project= @user.projects.create(name: Faker::Name.first_name)
  end


  describe "Validations" do
    it "should no save a TODO without a title" do
      todo = @project.todos.new()
      todo.save.should be_false
    end

    it "should  save a TODO with a title" do

      todo = @project.todos.new(title: "Moshe")
      todo.save.should be_true
    end
  end
end
