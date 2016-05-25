class CreateDiagnosticos < ActiveRecord::Migration
  def change
    create_table :diagnosticos do |t|
      t.datetime :fecha
      t.text :description
      t.integer :fk_id_persona

      t.timestamps null: false
    end
  end
end
