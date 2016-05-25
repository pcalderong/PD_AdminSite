class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :nombre
      t.string :primer_apellido
      t.string :segundo_apellido
      t.datetime :fecha_nacimiento
      t.string :correo_electronico
      t.boolean :genero
      t.string :cedula
      t.integer :estado_civil
      t.string :telefono

      t.timestamps null: false
    end
  end
end
