class FixTypeColumnName < ActiveRecord::Migration
  def change
    rename_column :lookups, :type, :lookup_type
  end
end
