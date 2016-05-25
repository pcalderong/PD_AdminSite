class HistorialClinicosController < ApplicationController
  before_action :set_historial_clinico, only: [:show, :edit, :update, :destroy]

  # GET /historial_clinicos
  # GET /historial_clinicos.json
  def index
    @persona = Persona.find(params[:persona_id])
    @historial_clinico = @persona.historial_clinicos.last(:fecha => "fecha desc", :limit => 1)
    format.html { render :show }
  end

  # GET /historial_clinicos/1
  # GET /historial_clinicos/1.json
  def show
  end

  # GET /historial_clinicos/new
  def new
    @historial_clinico = HistorialClinico.new
  end

  # GET /historial_clinicos/1/edit
  def edit
  end

  # POST /historial_clinicos
  # POST /historial_clinicos.json
  def create
    @persona = Persona.find(params[:persona_id])
    @historial_clinico = @persona.historial_clinicos.new(historial_clinico_params)
    respond_to do |format|
      if @historial_clinico.save
        format.html { redirect_to @persona, notice: 'Historial clinico was successfully created.' }
        format.json { render :show, status: :created, location: @persona }
      else
        format.html { render :new }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historial_clinicos/1
  # PATCH/PUT /historial_clinicos/1.json
  def update
    respond_to do |format|
      if @historial_clinico.update(historial_clinico_params)
        format.html { redirect_to @historial_clinico, notice: 'Historial clinico was successfully updated.' }
        format.json { render :show, status: :ok, location: @historial_clinico }
      else
        format.html { render :edit }
        format.json { render json: @historial_clinico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historial_clinicos/1
  # DELETE /historial_clinicos/1.json
  def destroy
    @persona = Persona.find(params[:persona_id])
    @historial_clinico = @persona.historial_clinicos.find(params[:id])
    @historial_clinico.destroy
    respond_to do |format|
      format.html { redirect_to historial_clinicos_url, notice: 'Historial clinico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historial_clinico
      @historial_clinico = HistorialClinico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historial_clinico_params
      params.require(:historial_clinico).permit(:fk_id_persona, :fecha, :fk_id_lookup, :orden)
    end
end
