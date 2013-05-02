class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.integer :label_id, null: false
      t.boolean :status, default: true
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
