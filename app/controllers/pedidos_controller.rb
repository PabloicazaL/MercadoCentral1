class PedidosController < ApplicationController


	before_action :authenticate_user!

	def preload
		comida = Comida.find(params[:comida_id])
		today = Date.today
		pedidos = comida.pedidos.where("fecha_pedido >= ?", today)

		render json: pedidos	
	end

	def create
		comida = Comida.find(params[:comida_id])
		if current_user == comida.user
			redirect_to comida, alert: "¡No puedes reservar tu propio cuarto!"
		else

		@pedido = current_user.pedidos.create(pedido_params)
		redirect_to @pedido.comida, notice: "Tu pedido se ha creado exitosamente..."
		end
	end

	def tus_pedidos
		@pedidos = current_user.pedidos
	end

	def tus_ventas
		@comidas = current_user.comidas
	end

	def pago
	
	end


	private



		def pedido_params
			params.require(:pedido).permit(:fecha_pedido, :precio, :total, :comida_id, :cantidad)
		end
end