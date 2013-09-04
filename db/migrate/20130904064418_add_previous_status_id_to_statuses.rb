class AddPreviousStatusIdToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :previous_status_id, :integer
  end
end
