class Persona < ActiveRecord::Base
	has_many :info_contactos
	has_many :direccions
	has_many :info_extra_pacientes
	has_many :historial_clinicos
	has_many :diagnosticos
	accepts_nested_attributes_for :info_extra_pacientes
	validates :cedula, length: { maximum: 9, message: "debe ser de 9 digitos"}
  validates :telefono, length: { maximum: 8, message: "debe ser de 8 digitos"}
end
