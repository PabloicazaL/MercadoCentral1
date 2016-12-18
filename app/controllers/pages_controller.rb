class PagesController < ApplicationController
  def home
  	@comidas = Comida.limit(3)
  end

  def search
  	
  	if params[:search].present? && params[:search].strip != ""  #Si el usuario introdujo ubicación
  		session[:loc_search] = params[:search]
  	end

  	arrResult = Array.new

  	if session[:loc_search] && session[:loc_search] != ""  #Si el usuario dejo ubicaciñon en blanco return todos los cuartos, si no, dar lista de cuertos con un radio de 5 miles.
  		@comidas_address = Comida.where(active: true).near(session[:loc_search], 5, order: 'distance')
  	else
  		@comidas_address = Comida.where(active: true).all
  	end

  	@search = @comidas_address.ransack(params[:q])
  	@comidas = @search.result

  	@arrComidas = @comidas.to_a

  end
end
