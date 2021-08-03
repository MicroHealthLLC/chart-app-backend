class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :description
      t.string :chart_type
      t.integer :channel_id
      t.integer :data_set_id
      t.string :tags, array: true

      t.timestamps
    end
  end
end
