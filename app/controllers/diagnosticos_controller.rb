class DiagnosticosController < ApplicationController
  before_action :set_diagnostico, only: [:show, :edit, :update, :destroy]

  # GET /diagnosticos
  # GET /diagnosticos.json
  def index
    @persona = Persona.find(params[:persona_id])
    @diagnosticos = @persona.diagnosticos.all
  end

  # GET /diagnosticos/1
  # GET /diagnosticos/1.json
  def show
  end

  # GET /diagnosticos/new
  def new
    @diagnostico = Diagnostico.new
  end

  # GET /diagnosticos/1/edit
  def edit
  end

  # POST /diagnosticos
  # POST /diagnosticos.json
  def create
    @persona = Persona.find(params[:persona_id])
    @diagnostico = @persona.diagnosticos.new(diagnostico_params)
    respond_to do |format|
      if @diagnostico.save
        format.html { redirect_to @persona, notice: 'Diagnostico agregado satisfactoriamente' }
        format.json { render :show, status: :created, location: @persona }
      else
        format.html { render :new }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diagnosticos/1
  # PATCH/PUT /diagnosticos/1.json
  def update
    @persona = Persona.find(params[:persona_id])
    @diagnostico = @persona.diagnosticos.find(params[:id])
    respond_to do |format|
      if @diagnostico.update(diagnostico_params)
        format.html { redirect_to @persona, notice: 'Diagnostico was successfully updated.' }
        format.json { render :show, status: :ok, location: @persona }
      else
        format.html { render :edit }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diagnosticos/1
  # DELETE /diagnosticos/1.json
  def destroy
    @persona = Persona.find(params[:persona_id])
    @diagnostico = @persona.diagnosticos.find(params[:id])
    @diagnostico.destroy
    respond_to do |format|
      format.html { redirect_to @persona, notice: 'Diagnostico satisfactoriamente borrado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diagnostico
      @diagnostico = Diagnostico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diagnostico_params
      params.require(:diagnostico).permit(:fecha, :description, :especialidad_id, :padecimiento, :tipo_padecimiento, :hospital, :fk_id_persona)
    end
end
