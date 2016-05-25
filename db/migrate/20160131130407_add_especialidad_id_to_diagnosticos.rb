class AddEspecialidadIdToDiagnosticos < ActiveRecord::Migration
  def change
    add_column :diagnosticos, :especialidad_id, :string
  end
end
