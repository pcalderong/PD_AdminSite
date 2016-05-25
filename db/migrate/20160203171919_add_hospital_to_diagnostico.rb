class AddHospitalToDiagnostico < ActiveRecord::Migration
  def change
    add_column :diagnosticos, :hospital, :integer
  end
end
