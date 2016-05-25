class InfoContactosController < ApplicationController
  before_action :set_info_contacto, only: [:show, :edit, :update, :destroy]

  # GET /info_contactos
  # GET /info_contactos.json
  def index
    @persona = Persona.find(params[:persona_id])
    @info_contacto = @persona.info_contactos.all
    format.html { render :show }
  end

  # GET /info_contactos/1
  # GET /info_contactos/1.json
  def show
  end

  # GET /info_contactos/new
  def new
    @info_contacto = InfoContacto.new
  end

  # GET /info_contactos/1/edit
  def edit
  end

  # POST /info_contactos
  # POST /info_contactos.json
  def create
    @persona = Persona.find(params[:persona_id])
    @info_contacto = @persona.info_contactos.new(info_contacto_params)
    respond_to do |format|
      if @info_contacto.save
        format.html { redirect_to @persona, notice: 'Info contacto was successfully created.' }
        format.json { render :show, status: :created, location: @persona }
      else
        format.html { render :new }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /info_contactos/1
  # PATCH/PUT /info_contactos/1.json
  def update
    @persona = Persona.find(params[:persona_id])
    respond_to do |format|
      if @persona.info_contacto.update(info_contacto_params)
        format.html { redirect_to @info_contacto, notice: 'Info contacto was successfully updated.' }
        format.json { render :show, status: :ok, location: @info_contacto }
      else
        format.html { render :edit }
        format.json { render json: @info_contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /info_contactos/1
  # DELETE /info_contactos/1.json
  def destroy
    @persona = Persona.find(params[:persona_id])
    @info_contacto = @persona.info_contactos.find(params[:id])
    @info_contacto.destroy
    respond_to do |format|
      format.html { redirect_to @persona, notice: 'Contacto Eliminado' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_info_contacto
      @info_contacto = InfoContacto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def info_contacto_params
      params.require(:info_contacto).permit(:telefono, :nombre_contacto, :parentesco, :fk_id_paciente)
    end
end
