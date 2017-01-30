class ArchivosController < ApplicationController
  before_action :set_archivo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index]

  # GET /archivos
  # GET /archivos.json
  def index
    @archivos = Archivo.all
  end

  # GET /archivos/1
  # GET /archivos/1.json
  def show
  end

  # GET /archivos/new
  def new
    @archivo = Archivo.new
  end

  # GET /archivos/1/edit
  def edit
  end

  # POST /archivos
  # POST /archivos.json
  def create
    @archivo = Archivo.new(archivo_params)

    respond_to do |format|
      if @archivo.save
        format.html { redirect_to @archivo, notice: 'Archivo was successfully created.' }
        format.json { render :show, status: :created, location: @archivo }
      else
        format.html { render :new }
        format.json { render json: @archivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /archivos/1
  # PATCH/PUT /archivos/1.json
  def update
    respond_to do |format|
      if @archivo.update(archivo_params)
        format.html { redirect_to @archivo, notice: 'Archivo was successfully updated.' }
        format.json { render :show, status: :ok, location: @archivo }
      else
        format.html { render :edit }
        format.json { render json: @archivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /archivos/1
  # DELETE /archivos/1.json
  def destroy
    @archivo.destroy
    respond_to do |format|
      format.html { redirect_to archivos_url, notice: 'Archivo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archivo
      @archivo = Archivo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def archivo_params
      params.require(:archivo).permit(:fecha, :folio, :cliente, :photo, :referencia,:nombre)
    end
end
