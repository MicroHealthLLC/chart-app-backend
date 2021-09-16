class AddUserIdToDataSets < ActiveRecord::Migration[6.1]
  def change
    add_column :data_sets, :user_id, :integer
  end
end
