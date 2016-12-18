class PhotosController < ApplicationController
	def destroy

		@photo = Photo.find(params[:id])
		comida = @photo.comida

		@photo.destroy
		@photos = Photo.where(comida_id: comida.id)

		respond_to :js
		
	end
end