class CreateDevelopmentPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :development_plans do |t|
      t.string :title
      t.timestamps
    end
  end
end
