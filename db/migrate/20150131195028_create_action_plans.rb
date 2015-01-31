class CreateActionPlans < ActiveRecord::Migration
  def change
    create_table :action_plans do |t|
      t.string :title
      t.integer :kind
      t.text :description
      t.integer :assigned_to
      t.date :term
      t.date :finish_date
      t.integer :risk_id
      t.boolean :effective

      t.timestamps
    end
  end
end
