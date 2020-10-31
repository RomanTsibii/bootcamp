class AddTaskToDevelopmentPlans < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :development_plan, foreign_key: true
  end
end
