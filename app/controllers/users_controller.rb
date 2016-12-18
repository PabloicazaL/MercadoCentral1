class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@comidas = @user.comidas
	end
end