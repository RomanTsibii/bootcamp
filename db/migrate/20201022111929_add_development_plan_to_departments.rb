class AddDevelopmentPlanToDepartments < ActiveRecord::Migration[6.0]
  def change
    add_reference :development_plans, :department, foreign_key: true
  end
end
