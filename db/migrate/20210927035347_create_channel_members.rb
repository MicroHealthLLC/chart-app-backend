class CreateChannelMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :channel_members do |t|
      t.integer :channel_id
      t.integer :user_id

      t.timestamps
    end
  end
end
