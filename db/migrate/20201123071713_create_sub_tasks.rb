class CreateSubTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_tasks do |t|
      t.integer :task_id
      t.string :name, null: false
      t.integer :status, default: 0
    end
  end
end
