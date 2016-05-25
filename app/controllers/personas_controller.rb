require 'spreadsheet'
require 'spreadsheet/excel'

class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :edit, :update, :destroy]
  # GET /personas
  # GET /personas.json
  # def show
  #   @city = City.find_by("id = ?", params[:trip][:city_id])
  # end
  #
  # def update_cities
  #   @cities = City.where("country_id = ?", params[:country_id])
  #   respond_to do |format|
  #     format.js
  #   end
  # end

  def index
    @personas = Persona.all
  end

  # GET /personas/1
  # GET /personas/1.json
  def show
    @provincias = Lookup.where("descripcion = ?", "Provincia")
    @cantones = Lookup.where("descripcion = ?", "Canton - #{@provincias.first.value}")
    puts "cantones #{@cantones}"
    @distritos = Lookup.where("descripcion = ?", "Distrito - #{@cantones.first.value}")
    @padecimientos = Lookup.where("descripcion = ?", "Padecimiento")
    @tipos_padecimientos = Lookup.where("descripcion = ?", "Padecimiento - #{@padecimientos.first.value}")
  end

  def update_cantones
    provincia = Lookup.where("id = ? ", params[:provincia_id]).as_json
    @cantones = Lookup.where("descripcion = ? ", "Canton - #{provincia[0]['value']}") #.collect { |m| [m.value, m.id] }
    respond_to do |format|
      format.js
    end
  end

  def update_distritos
    canton = Lookup.where("id = ? ", params[:canton_id]).as_json
    @distritos = Lookup.where("descripcion = ? ", "Distrito - #{canton[0]['value']}") #.collect { |m| [m.value, m.id] }
    respond_to do |format|
      format.js
    end
  end

  def update_tipos_padecimientos
    padecimiento = Lookup.where("id = ? ", params[:padecimiento_id]).as_json
    @tipos_padecimientos = Lookup.where("descripcion = ? ", "Padecimiento - #{padecimiento[0]['value']}") #.collect { |m| [m.value, m.id] }
    puts " tipos #{@tipos_padecimientos.inspect}"
    respond_to do |format|
      format.js
    end
  end
  # GET /personas/new
  def new
    @persona = Persona.new
  end

  # GET /personas/1/edit
  def edit
  end

  # POST /personas
  # POST /personas.json
  def create
    @persona = Persona.new(persona_params)
    # If Genero False = femenino
    respond_to do |format|
      if @persona.save
        format.html { redirect_to @persona, notice: 'Informacion guardada correctamente.' }
        format.json { render :show, status: :created, location: @persona }
      else
        format.html { render :new }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personas/1
  # PATCH/PUT /personas/1.json
  def update
    respond_to do |format|
      if @persona.update(persona_params)
        # @persona.build_info_extra_paciente
        format.html { redirect_to @persona, notice: 'Informacion actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @persona }
      else
        format.html { render :edit }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personas/1
  # DELETE /personas/1.json
  def destroy
    @persona.destroy
    respond_to do |format|
      format.html { redirect_to personas_url, notice: 'Persona was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def importar
    @file = params[:file]
    book = Spreadsheet.open @file.tempfile.to_path.to_s
    # '/Users/paolacalderon/Documents/ProyectoDaniel/importar-pacientes.xls'
    sheet1 = book.worksheet 0
    sheet1.each 1 do |row|
      @persona = Persona.new
      @persona.nombre = row[0]
      @persona.primer_apellido = row[1]
      @persona.segundo_apellido = row[2]
      @persona.cedula = row[3]
      @persona.telefono = row[4]
      @persona.save
     end
    redirect_to personas_url
  end

  def export()
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.name = 'Informacion Pacientes'
    sheet2 = book.create_worksheet
    sheet3 = book.create_worksheet
    sheet4 = book.create_worksheet
    sheet5 = book.create_worksheet
    sheet6 = book.create_worksheet
    sheet2.name = 'Informacion Contactos'
    sheet3.name = 'Informacion Extra'
    sheet4.name = 'Direccion'
    sheet5.name = 'Diagnostico'
    sheet6.name = 'Historial Medico'
    sheet1.row(0).concat %w{Nombre PrimerApellido SegundoApellido Cedula Telefono}
    sheet2.row(0).concat %w{Nombre Contacto Parentesco Telefono}
    sheet3.row(0).concat %w{Nombre Estudia Trabaja LugarEstudioTrabajo TieneHijos CantidadHijos ReferenciaTrabajoSocial AyudaAlimentos AyudaMedicamento}
    sheet4.row(0).concat %w{Nombre Provincia Canton Distrito DireccionExacta}
    sheet5.row(0).concat %w{Nombre Fecha Especialidad Padecimiento TipoPadecimiento Hospital Descripcion}
    sheet6.row(0).concat %w{Nombre Fecha EstadoActual}
    @personas = Persona.all
    i=1
    l=1
    l1 =1;
    l2 =1;
    l3 =1;
    l4 =1;
    @personas.each do |p|
      sheet1.row(i).push p.nombre, p.primer_apellido, p.segundo_apellido, p.cedula.nil? ? " ":p.cedula, p.telefono.nil? ? " ":p.telefono
      i=i+1
      nombre = p.nombre + " " + p.primer_apellido + " " + p.segundo_apellido
      p.info_contactos.each do |ic|
        l=l+1
        sheet2.row(l).push nombre, ic.nombre_contacto.nil? ? " ": ic.nombre_contacto, ic.parentesco.nil? ? " ":ic.parentesco, ic.telefono.nil? ? " ":ic.telefono
      end
      p.info_extra_pacientes.each do |ic|
        l1=l1+1
        sheet3.row(l1).push nombre, ic.estudiante ? "Si" : "No", ic.trabajador ? "Si" : "No",
                           ic.lugar_estudio_trabajo.nil? ? " ": ic.lugar_estudio_trabajo,
                           ic.hijos ? "Si" : "No",
                           ic.cant_hijos.nil? ? " ": ic.cant_hijos,
                           ic.referencia_trab_social ? "Si" : "No",
                           ic.ayuda_alimentos ? "Si" : "No",
                           ic.ayuda_medicamento ? "Si" : "No"
      end
      p.direccions.each do |ic|
        l2=l2+1
        sheet4.row(l2).push nombre, ic.provincia.nil? ? " ": id_to_value_direccion(ic.provincia),
                           ic.canton.nil? ? " ": id_to_value_direccion(ic.canton),
                           ic.distrito.nil? ? " ": id_to_value_direccion(ic.distrito),
                           ic.direccion_exacta.nil? ? " ": ic.direccion_exacta
      end
      p.diagnosticos.each do |ic|
        l3=l3+1
        sheet5.row(l3).push nombre, ic.fecha.nil? ? " ": ic.fecha.strftime("%d-%m-%Y") ,
                           ic.especialidad_id.nil? ? " ": id_to_value_direccion(ic.especialidad_id),
                           ic.padecimiento.nil? ? " ": id_to_value_direccion(ic.padecimiento),
                           ic.tipo_padecimiento.nil? ? " ": id_to_value_direccion(ic.tipo_padecimiento),
                           ic.hospital.nil? ? " ": id_to_value_direccion(ic.hospital),
                           ic.description.nil? ? " ": ic.description
      end
      p.historial_clinicos.each do |ic|
        l4=l4+1
        sheet6.row(l4).push nombre, ic.fecha.nil? ? " ": ic.fecha.strftime("%d-%m-%Y") ,
                           ic.fk_id_lookup.nil? ? " ": id_to_value_direccion(ic.fk_id_lookup)
      end
    end
    # sheet1[1,0] = 'Japan'
    # row = sheet1.row(1)
    # row.push 'Creator of Ruby'
    # row.unshift 'Yukihiro Matsumoto'
    # sheet1.row(2).replace [ 'Daniel J. Berger', 'U.S.A.',
    #                         'Author of original code for Spreadsheet::Excel' ]
    # sheet1.row(3).push 'Charles Lowe', 'Author of the ruby-ole Library'
    # sheet1.row(3).insert 1, 'Unknown'
    # sheet1.update_row 4, 'Hannes Wyss', 'Switzerland', 'Author'

    sheet1.row(0).height = 18

    format = Spreadsheet::Format.new :color => :blue,
                                     :weight => :bold,
                                     :size => 18
    sheet1.row(0).default_format = format

    bold = Spreadsheet::Format.new :weight => :bold
    4.times do |x| sheet1.row(x + 1).set_format(0, bold) end
    # book.write '/Users/paolacalderon/Documents/ProyectoDaniel/excel-pacientes.xls'
    t = Time.now.strftime('%v %r')
    book.write "excel-pacientes-#{t}.xls"
    send_file "excel-pacientes-#{t}.xls", :type=>"application/excel", :filename => "excel-pacientes-#{t}.xls", :stream => false
    #redirect_to personas_url
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persona
      @persona = Persona.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def persona_params
      params.require(:persona).permit(:nombre, :primer_apellido, :segundo_apellido, :fecha_nacimiento, :correo_electronico, :genero, :cedula, :estado_civil, :telefono)
    end

    def id_to_value_direccion(id)
      return Lookup.where(id: id).first.value
    end
end
