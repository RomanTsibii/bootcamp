class CreateFlowSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :flow_steps do |t|
      t.string :title
      t.belongs_to :development_plan, foreign_key: true
      t.timestamps
    end
  end
end
