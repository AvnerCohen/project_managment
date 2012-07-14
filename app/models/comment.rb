class Comment < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :item, :polymorphic => true
  attr_accessible :user_id, :body, :item_id, :item_type
end
