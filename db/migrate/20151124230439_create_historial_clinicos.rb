class CreateHistorialClinicos < ActiveRecord::Migration
  def change
    create_table :historial_clinicos do |t|
      t.integer :fk_id_persona
      t.datetime :fecha
      t.integer :fk_id_lookup
      t.integer :orden

      t.timestamps null: false
    end
  end
end
