class AddVersioningToRisk < ActiveRecord::Migration
  def up
    Risk.create_versioned_table
  end

  def down
    Risk.drop_versioned_table
  end
end
