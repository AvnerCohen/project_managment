class Project < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :status, :user_id
  attr_accessible :name, :status

  STATUS = {inactive: 0, active: 1, pending: 2, archived: 3}

  def status
    STATUS.key(read_attribute(:status))
  end

  def status=(s)
    write_attribute(:status, STATUS[s])
  end


end
