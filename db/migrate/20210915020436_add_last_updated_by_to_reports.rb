class AddLastUpdatedByToReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :last_updated_by, :string, default: ""
  end
end
