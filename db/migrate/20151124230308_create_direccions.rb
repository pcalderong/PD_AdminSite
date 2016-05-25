class CreateDireccions < ActiveRecord::Migration
  def change
    create_table :direccions do |t|
      t.integer :fk_id_persona
      t.integer :provincia
      t.integer :canton
      t.integer :distrito
      t.text :direccion_exacta

      t.timestamps null: false
    end
  end
end
