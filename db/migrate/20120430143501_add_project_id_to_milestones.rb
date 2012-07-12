class AddProjectIdToMilestones < ActiveRecord::Migration
  def change
    add_column :milestones, :project_id, :string
  end
end
