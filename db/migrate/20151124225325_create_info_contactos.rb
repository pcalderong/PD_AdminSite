class CreateInfoContactos < ActiveRecord::Migration
  def change
    create_table :info_contactos do |t|
      t.string :telefono
      t.string :nombre_contacto
      t.string :parentesco
      t.integer :fk_id_paciente

      t.timestamps null: false
    end
  end
end
