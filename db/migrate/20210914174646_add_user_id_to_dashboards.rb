class AddUserIdToDashboards < ActiveRecord::Migration[6.1]
  def change
    add_column :dashboards, :user_id, :integer
  end
end
