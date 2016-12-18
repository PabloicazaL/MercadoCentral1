class ComidasController < ApplicationController
  before_action :set_comida, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]



  def index
    @comidas = current_user.comidas
  end

  def show
    @photos = @comida.photos

    @booked = Pedido.where("comida_id = ? AND user_id = ?", @comida.id, current_user.id).present? if current_user

    @reviews = @comida.reviews
    @hasReview = @reviews.find_by(user_id: current_user.id) if current_user
  end

  def new
    @comida = current_user.comidas.build
  end

  def create
    @comida = current_user.comidas.build(comida_params)

    if @comida.save
      if params[:images]
        params[:images].each do |image|
          @comida.photos.create(image: image)
        end
      end

      @photos = @comida.photos
      redirect_to edit_comida_path(@comida), notice: "Guardado..."
    else
      render :new
    end 
  end

  def edit
    if current_user.id == @comida.user.id
    @photos = @comida.photos
    else
      redirect_to root_path, notice: "No tienes permiso para acceder."
    end
  end

  def update
    if @comida.update(comida_params)
      if params[:images]
        params[:images].each do |image|
          @comida.photos.create(image: image)
        end
      end

      redirect_to edit_comida_path(@comida), notice: "Actualizado..."
    else
      render :edit
    end
    
  end

  private 
  def set_comida
    @comida = Comida.find(params[:id])
    
  end

  def comida_params
    params.require(:comida).permit(:tipo_comida, :tipo_cocina, :porciones, :comida_nombre, :resumen, :es_alergia_habas, :es_alergia_habas_soya, :es_alergia_nueces, :es_alergia_huevos, :es_alergia_mariscos, :es_alergia_gluten, :es_alergia_pescado, :es_alergia_sesamo, :es_diabetes, :es_halal, :es_intolerante_lactosa, :es_kosher, :es_nocerdo, :es_organica, :es_singluten, :es_vegana, :es_vegetariana, :precio, :tiempo_anticipacion, :es_servicio_domicilio, :rango, :direccion, :active)
    
  end
end

