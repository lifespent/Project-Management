class Project < ActiveRecord::Base
  attr_accessible :begin, :budget, :end, :title, :company_id, :milestones_attributes
  has_many :milestones, :dependent => :destroy
  belongs_to :company
  accepts_nested_attributes_for :milestones, allow_destroy: true
  
end
