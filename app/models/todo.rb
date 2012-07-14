class Todo < ActiveRecord::Base
  #attr_accessible :title, :body
  attr_accessible :title

  validates_presence_of :title
end
