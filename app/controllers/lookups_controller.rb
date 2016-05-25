class LookupsController < ApplicationController
  before_action :set_lookup, only: [:show, :edit, :update, :destroy]

  # GET /lookups
  # GET /lookups.json\

  def index
    @lookup_type = params[:lookup_type]
    type_value = get_type_value(@lookup_type)
    @lookups = Lookup.where(lookup_type: type_value)
  end

  # GET /lookups/1
  # GET /lookups/1.json
  def show
  end

  # GET /lookups/new
  def new
    @lookup = Lookup.new
  end

  # GET /lookups/1/edit
  def edit
  end

  # POST /lookups
  # POST /lookups.json
  def create
    @lookup = Lookup.new(lookup_params)
    respond_to do |format|
      if @lookup.save
        format.html { redirect_to lookups_path(@lookup, :lookup_type => get_type_label(@lookup.lookup_type)), notice: "#{@lookup.lookup_type} guardada" }
        format.json { render :show, status: :created, location: @lookup }
      else
        format.html { render :new }
        format.json { render json: @lookup.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /lookups/1
  # PATCH/PUT /lookups/1.json
  def update
    respond_to do |format|
      if @lookup.update(lookup_params)
        format.html { redirect_to lookups_url, notice: 'Lookups was successfully updated.' }
        format.json { render :show, status: :ok, location: @lookup }
      else
        format.html { render :edit }
        format.json { render json: @lookup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lookups/1
  # DELETE /lookups/1.json
  def destroy
    lookup_label = get_type_label(@lookup.lookup_type)
    @lookup.destroy
    respond_to do |format|
      format.html { redirect_to lookups_path(:lookup_type => lookup_label), notice: "#{lookup_label} se ha eliminado correctamente" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lookup
      @lookup = Lookup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lookup_params
      params.require(:lookup).permit(:parent, :value, :descripcion, :lookup_type)
    end

    def get_type_value(value)
      case value
      when "Direcciones"
          return 'Direccion'
        when "Estados Paciente"
          return 'EstadoPaciente'
        when "Especialidades"
          return 'Especialidad'
        when "Padecimientos"
          return 'Padecimiento'
        when "Hospitales"
          return 'Hospital'
        when "Tipo de Atencion"
          return 'TipoAtencion'
        when "Estado Civil"
          return 'EstadoCivil'
        end
      end

      def get_type_label(value)
        case value
          when 'Direccion'
              return "Direcciones"
          when 'EstadoPaciente'
              return "Estados Paciente"
          when 'Especialidad'
              return "Especialidades"
          when "Padecimiento"
              return 'Padecimientos'
          when "Hospital"
              return 'Hospitales'
          when "TipoAtencion"
              return 'Tipo de Atencion'
          when "EstadoCivil"
              return 'Estado Civil'
          end
        end
end
