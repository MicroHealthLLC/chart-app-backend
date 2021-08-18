class CreateDashboards < ActiveRecord::Migration[6.1]
  def change
    create_table :dashboards do |t|
      t.string :title
      t.string :description
      t.integer :channel_id
      t.string :layout
      t.string :tags, array: true

      t.timestamps
    end
  end
end
