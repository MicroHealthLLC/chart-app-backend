class CreateDataSetChannels < ActiveRecord::Migration[6.1]
  def change
    create_table :data_set_channels do |t|
      t.integer :data_set_id
      t.integer :channel_id

      t.timestamps
    end
  end
end
