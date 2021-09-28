class AddMemberIdsToChannel < ActiveRecord::Migration[6.1]
  def change
    add_column :channels, :member_ids, :integer, array:true, default: []
  end
end
