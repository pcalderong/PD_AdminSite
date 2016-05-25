class PacientesHospitalesPdf < Prawn::Document

  def initialize(pacientes, view)
    super()
    @pacientes = pacientes
    @view = view
    puts "My clase pacientes hospital pdf"

  end

end
