class ChangeLookupTableName < ActiveRecord::Migration
  def change
    rename_table :lookups, :lookups
  end
end
