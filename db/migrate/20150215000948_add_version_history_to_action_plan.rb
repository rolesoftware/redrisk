class AddVersionHistoryToActionPlan < ActiveRecord::Migration
  def up
    ActionPlan.create_versioned_table
  end

  def down
    ActionPlan.drop_versioned_table
  end
end
