class CreateRisks < ActiveRecord::Migration
  def change
    create_table :risks do |t|
      t.string :title
      t.integer :status
      t.text :description
      t.integer :source
      t.integer :category
      t.date :identification_date
      t.integer :created_by
      t.integer :assigned_to
      t.integer :probability
      t.integer :impact
      t.integer :priority
      t.text :trigger
      t.integer :strategy
      t.integer :project_id
      t.integer :origin
      t.float :effort
      t.float :cost

      t.timestamps
    end
  end
end
