class CreateReportTags < ActiveRecord::Migration[6.1]
  def change
    create_table :report_tags do |t|
      t.integer :report_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
