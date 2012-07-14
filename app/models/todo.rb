class Todo < ActiveRecord::Base
  belongs_to :project
  #attr_accessible :title, :body
  attr_accessible :title

  validates_presence_of :title

  has_many :comments, :as => :item
end
