class AddApproverIdToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :approver_id, :integer
  end
end
