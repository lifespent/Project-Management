class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :done
      t.string :milestone_id

      t.timestamps
    end
  end
end
