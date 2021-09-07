class AddColorSchemeIdToReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :color_scheme_id, :integer, default: 1
  end
end
