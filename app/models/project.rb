class Project < ActiveRecord::Base
	validates_presence_of :name, :status
	attr_accessible :name, :status
end