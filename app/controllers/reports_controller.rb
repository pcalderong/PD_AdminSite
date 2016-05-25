
require 'spreadsheet'
require 'spreadsheet/excel'

class ReportsController < ApplicationController


  def index
    @reports = Report.all
    @hospitales = Lookup.where("lookup_type = ?", "Hospital")
    @provincias = Lookup.where("descripcion = ?", "Provincia")
    @cantones = Lookup.where("descripcion = ?", "Canton - #{@provincias.first.value}")
    @distritos = Lookup.where("descripcion = ?", "Distrito - #{@cantones.first.value}")
    @padecimientos = Lookup.where("descripcion = ?", "Padecimiento")
    @tipos_padecimientos = Lookup.where("descripcion = ?", "Padecimiento - #{@padecimientos.first.value}")
  end

  def update_cantones_report
    provincia = Lookup.where("id = ? ", params[:provincia_id]).as_json
    @cantones = Lookup.where("descripcion = ? ", "Canton - #{provincia[0]['value']}") #.collect { |m| [m.value, m.id] }
    respond_to do |format|
      format.js
    end
  end

  def update_distritos_report
    canton = Lookup.where("id = ? ", params[:canton_id]).as_json
    @distritos = Lookup.where("descripcion = ? ", "Distrito - #{canton[0]['value']}") #.collect { |m| [m.value, m.id] }
    respond_to do |format|
      format.js
    end
  end

  def update_tipos_padecimientos_report
    padecimiento = Lookup.where("id = ? ", params[:padecimiento_id]).as_json
    @tipos_padecimientos = Lookup.where("descripcion = ? ", "Padecimiento - #{padecimiento[0]['value']}") #.collect { |m| [m.value, m.id] }
    puts " tipos #{@tipos_padecimientos.inspect}"
    respond_to do |format|
      format.js
    end
  end

  def template
    send_data "/assets/templates/template.xls", :type=>"application/excel", :filename => "template.xls", :x_sendfile=>true
  end
  def generate_report
    case params[:report]
      when "Pacientes_Hospital"
        generate_report_by_hospital()
      when "Pacientes_Fallecidos_Periodo"
        generate_report_by_fallecidos()
      when "Pacientes_Genero"
        generate_report_by_genero()
      when "Pacientes_Nuevos_Mes"
        generate_report_by_mes()
      when "Pacientes_Ubicacion"
        generate_report_by_ubicacion()
      when "Pacientes_Padecimiento"
        generate_report_by_padecimiento()
      when "Pacientes_Centro_Estudio"
        generate_report_by_centro_estudio()
      when "Pacientes_Con_Hijos"
        generate_report_by_hijos()
      when "Pacientes_Por_Edad"
        generate_report_by_edad()
    end

  end

  def generate_report_by_hospital
    report_id = Report.find(1)
    hospi = Lookup.find(params[:hospi])
    @pacientes_hospi = Persona.joins(:diagnosticos)
                              .where(:diagnosticos => {:hospital => params[:hospi]})
                              .group("personas.id")
    puts "Reporte Pacientes: #{@pacientes_hospi.inspect}"
    create_doc_reporte(@pacientes_hospi, hospi.value)
    # redirect_to reports_url
  end

  def generate_report_by_fallecidos
    report_id = Report.find(2)
    if (params[:fecha_ini].eql?("") && params[:fecha_fin].eql?(""))
      @pacientes_fallecidos = Persona.joins(:historial_clinicos)
                                .where(:historial_clinicos => {:fk_id_lookup => '7'})
                                .group("personas.id")
    elsif
      fecha_ini = Date.parse(params[:fecha_ini])
      if params[:fecha_fin].eql?("")
        fecha_fin = Date.today
      else
        fecha_fin = Date.parse(params[:fecha_fin])
      end
      @pacientes_fallecidos = Persona.joins(:historial_clinicos)
                                .where(:historial_clinicos => {:fecha => (fecha_ini .. fecha_fin), :fk_id_lookup => '7'})
                                .group("personas.id")
    end
    puts "Reporte Pacientes: #{@pacientes_fallecidos.inspect}"
    create_doc_reporte(@pacientes_fallecidos,"fallecidos")
    # redirect_to reports_url
  end

  def generate_report_by_genero
    report_id = Report.find(3)
    @pacientes_genero = Persona.where(:genero => params[:genero])
                              .group("personas.id")
    puts "Reporte Pacientes: #{@pacientes_genero.inspect}"
    create_doc_reporte(@pacientes_genero, params[:genero] == '0' ? "Femenino" : "Masculino")
    # redirect_to reports_url
  end
  def generate_report_by_mes
    report_id = Report.find(3)
    @pacientes_mes = Persona.where(:created_at =>  (Date.today.at_beginning_of_month .. Date.today.at_end_of_month))
                              .group("personas.id")
    puts "Reporte Pacientes: #{@pacientes_mes.inspect}"
    create_doc_reporte(@pacientes_mes, Date.today.strftime("%B"))
    # redirect_to reports_url
  end

  def generate_report_by_ubicacion
    report_id = Report.find(4)
    @pacientes_ubicacion = Persona.joins(:direccions)
                                  .where(:direccions =>  {:provincia => params[:provincia]})
                              .group("personas.id")
    puts "Reporte Pacientes: #{@pacientes_ubicacion.inspect}"
    create_doc_reporte(@pacientes_ubicacion, Lookup.find(params[:provincia]).value)
    # redirect_to reports_url
  end

  def generate_report_by_padecimiento
    report_id = Report.find(5)
    @pacientes_padecimiento = Persona.joins(:diagnosticos)
                                  .where(:diagnosticos =>  {:padecimiento => params[:padecimiento]})
                              .group("personas.id")
    puts "Reporte Pacientes: #{@pacientes_padecimiento.inspect}"
    create_doc_reporte(@pacientes_padecimiento, Lookup.find(params[:padecimiento]).value)
    # redirect_to reports_url
  end

  def generate_report_by_centro_estudio
    report_id = Report.find(5)
    @pacientes_centro_estudio= Persona.joins(:info_extra_pacientes)
                                  .where("info_extra_pacientes.lugar_estudio_trabajo LIKE '%#{params[:centro_estudio]}%'")
                              .group("personas.id")
    puts "Reporte Pacientes: #{@pacientes_centro_estudio.inspect}"
    create_doc_reporte_centro_estudio(@pacientes_centro_estudio, "Centro_Estudio")
    # redirect_to reports_url
  end

  def generate_report_by_hijos
    report_id = Report.find(5)
    @pacientes_hijos= Persona.joins(:info_extra_pacientes)
                              .where(:info_extra_pacientes => {:hijos => 1 })
    puts "Reporte Pacientes: #{@pacientes_hijos.inspect}"
    create_doc_reporte_hijos(@pacientes_hijos, "Hijos")
    # redirect_to reports_url
  end

  def generate_report_by_edad
    report_id = Report.find(6)
    date_ini = Date.new(Date.today.year - params[:edad_ini].to_i)
    date_fin = Date.new(Date.today.year - params[:edad_fin].to_i)
    @pacientes_edad= Persona.where(:fecha_nacimiento => (date_fin .. date_ini))
    puts "Reporte Pacientes: #{@pacientes_edad.inspect}"
    create_doc_reporte_edad(@pacientes_edad, "Edad")
    # redirect_to reports_url
  end

  def create_doc_reporte(personas, reporte)
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.name = 'Informacion Pacientes'
    sheet1.row(0).concat %w{Nombre PrimerApellido SegundoApellido Cedula Telefono}
    i=1
    personas.each do |p|
      sheet1.row(i).push p.nombre, p.primer_apellido, p.segundo_apellido, p.cedula.nil? ? " ":p.cedula, p.telefono.nil? ? " ":p.telefono
      i=i+1
    end
    sheet1.row(0).height = 18

    format = Spreadsheet::Format.new :color => :blue,
                                     :weight => :bold,
                                     :size => 18
    sheet1.row(0).default_format = format

    bold = Spreadsheet::Format.new :weight => :bold
    4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
    # book.write '/Users/paolacalderon/Documents/ProyectoDaniel/excel-pacientes.xls'
    t = Time.now.strftime('%v %r')
    book.write "Pacientes-#{reporte}-#{t}.xls"
    send_file "Pacientes-#{reporte}-#{t}.xls", :type=>"application/excel", :filename => "Pacientes-#{reporte}-#{t}.xls", :stream => false
  end

  def create_doc_reporte_centro_estudio(personas, reporte)
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.name = 'Informacion Pacientes'
    sheet1.row(0).concat %w{Nombre PrimerApellido SegundoApellido Cedula Telefono CentroEstudio}
    i=1
    personas.each do |p|
      sheet1.row(i).push p.nombre, p.primer_apellido, p.segundo_apellido, p.cedula.nil? ? " ":p.cedula, p.telefono.nil? ? " ":p.telefono, p.info_extra_pacientes[0].lugar_estudio_trabajo
      i=i+1
    end
    sheet1.row(0).height = 18

    format = Spreadsheet::Format.new :color => :blue,
                                     :weight => :bold,
                                     :size => 18
    sheet1.row(0).default_format = format

    bold = Spreadsheet::Format.new :weight => :bold
    4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
    # book.write '/Users/paolacalderon/Documents/ProyectoDaniel/excel-pacientes.xls'
    t = Time.now.strftime('%v %r')
    book.write "Pacientes-#{reporte}-#{t}.xls"
    send_file "Pacientes-#{reporte}-#{t}.xls", :type=>"application/excel", :filename => "Pacientes-#{reporte}-#{t}.xls", :stream => false
  end

  def create_doc_reporte_hijos(personas, reporte)
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.name = 'Informacion Pacientes'
    sheet1.row(0).concat %w{Nombre PrimerApellido SegundoApellido Cedula Telefono CantidadHijos}
    i=1
    personas.each do |p|
      sheet1.row(i).push p.nombre, p.primer_apellido, p.segundo_apellido, p.cedula.nil? ? " ":p.cedula, p.telefono.nil? ? " ":p.telefono, p.info_extra_pacientes[0].cant_hijos
      i=i+1
    end
    sheet1.row(0).height = 18

    format = Spreadsheet::Format.new :color => :blue,
                                     :weight => :bold,
                                     :size => 18
    sheet1.row(0).default_format = format

    bold = Spreadsheet::Format.new :weight => :bold
    4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
    # book.write '/Users/paolacalderon/Documents/ProyectoDaniel/excel-pacientes.xls'
    t = Time.now.strftime('%v %r')
    book.write "Pacientes-#{reporte}-#{t}.xls"
    send_file "Pacientes-#{reporte}-#{t}.xls", :type=>"application/excel", :filename => "Pacientes-#{reporte}-#{t}.xls", :stream => false
  end

  def create_doc_reporte_edad(personas, reporte)
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.name = 'Informacion Pacientes'
    sheet1.row(0).concat %w{Nombre PrimerApellido SegundoApellido Cedula Telefono Edad FechaNacimiento}
    i=1
    personas.each do |p|
      birth = Date.today.year - p.fecha_nacimiento.year
      sheet1.row(i).push p.nombre, p.primer_apellido, p.segundo_apellido, p.cedula.nil? ? " ":p.cedula, p.telefono.nil? ? " ":p.telefono, birth, p.fecha_nacimiento
      i=i+1
    end
    sheet1.row(0).height = 18

    format = Spreadsheet::Format.new :color => :blue,
                                     :weight => :bold,
                                     :size => 18
    sheet1.row(0).default_format = format

    bold = Spreadsheet::Format.new :weight => :bold
    4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
    # book.write '/Users/paolacalderon/Documents/ProyectoDaniel/excel-pacientes.xls'
    t = Time.now.strftime('%v %r')
    book.write "Pacientes-#{reporte}-#{t}.xls"
    send_file "Pacientes-#{reporte}-#{t}.xls", :type=>"application/excel", :filename => "Pacientes-#{reporte}-#{t}.xls", :stream => false
  end

  def id_to_value_direccion(id)
    return Lookup.where(id: id).first.value
  end
end
