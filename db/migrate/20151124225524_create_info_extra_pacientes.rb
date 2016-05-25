class CreateInfoExtraPacientes < ActiveRecord::Migration
  def change
    create_table :info_extra_pacientes do |t|
      t.boolean :estudiante
      t.boolean :trabajador
      t.string :lugar_estudio_trabajo
      t.boolean :hijos
      t.integer :cant_hijos
      t.boolean :referencia_trab_social
      t.boolean :ayuda_alimentos
      t.boolean :ayuda_medicamento
      t.string :fk_id_persona

      t.timestamps null: false
    end
  end
end
