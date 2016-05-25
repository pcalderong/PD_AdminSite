class CreateLookupDireccions < ActiveRecord::Migration
  def change
    create_table :lookups do |t|
      t.integer :parent
      t.string :value
      t.text :descripcion
      t.string :type

      t.timestamps null: false
    end
  end
end
