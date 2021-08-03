class CreateChannels < ActiveRecord::Migration[6.1]
  def change
    create_table :channels do |t|
      t.string :title
      t.text :description
      t.string :category

      t.timestamps
    end
  end
end
