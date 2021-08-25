class CreateDashboardTags < ActiveRecord::Migration[6.1]
  def change
    create_table :dashboard_tags do |t|
      t.integer :dashboard_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
