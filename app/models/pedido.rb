class Pedido < ActiveRecord::Base
  belongs_to :user
  belongs_to :comida
end
