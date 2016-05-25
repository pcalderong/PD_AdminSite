class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :report_name
      t.string :report_sql

      t.timestamps null: false
    end
  end
end
