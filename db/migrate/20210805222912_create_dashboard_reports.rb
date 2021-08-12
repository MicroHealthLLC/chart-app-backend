class CreateDashboardReports < ActiveRecord::Migration[6.1]
  def change
    create_table :dashboard_reports do |t|
      t.integer :dashboard_id
      t.integer :report_id

      t.timestamps
    end
  end
end
