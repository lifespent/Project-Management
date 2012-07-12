class Milestone < ActiveRecord::Base
  attr_accessible :title, :project_id, :position, :tasks_attributes
  belongs_to :project
  has_many :tasks, :dependent => :destroy
  accepts_nested_attributes_for :tasks, allow_destroy: true
  acts_as_list :scope => :project
end
