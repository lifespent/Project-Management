class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.decimal :budget
      t.date :begin
      t.date :end

      t.timestamps
    end
  end
end
