class CreateTaskManagements < ActiveRecord::Migration[6.0]
  def change
    create_table :task_managements do |t|
      t.integer :state, default: 0, null: false
      t.belongs_to :user, foreign_key: true
      t.belongs_to :task, foreign_key: true
      t.timestamps
    end
  end
end
