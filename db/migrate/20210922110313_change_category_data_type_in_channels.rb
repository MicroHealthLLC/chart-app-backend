class ChangeCategoryDataTypeInChannels < ActiveRecord::Migration[6.1]
  def change
    remove_column :channels, :category, :string
    add_column :channels, :category, :integer
  end
end
