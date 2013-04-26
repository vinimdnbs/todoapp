class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.integer :label_id, null: false
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
