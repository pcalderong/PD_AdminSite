class AddPadecimientoToDiagnostico < ActiveRecord::Migration
  def change
    add_column :diagnosticos, :padecimiento, :integer
  end
end
