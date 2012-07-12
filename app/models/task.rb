class Task < ActiveRecord::Base
  attr_accessible :description, :done, :position, :milestone_id, :title
  belongs_to :milestone
end
