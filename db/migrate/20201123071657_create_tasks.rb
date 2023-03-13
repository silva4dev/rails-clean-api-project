class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.string :name, null: false
      t.integer :status, default: 0
    end
  end
end
