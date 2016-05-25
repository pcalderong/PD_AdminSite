class AddCantHermanosToInfoExtraPacientes < ActiveRecord::Migration
  def change
    add_column :info_extra_pacientes, :cant_hermanos, :integer
  end
end
