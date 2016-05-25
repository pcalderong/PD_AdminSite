class AddTipoToDiagnosticos < ActiveRecord::Migration
  def change
    add_column :diagnosticos, :tipo_padecimiento, :integer
  end
end
