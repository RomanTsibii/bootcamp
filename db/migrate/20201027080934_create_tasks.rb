class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :level
      t.belongs_to :flow_step, foreign_key: true
      t.timestamps
    end
  end
end
