class AddTimeToPedidos < ActiveRecord::Migration
  def change
    add_column :pedidos, :hora, :datetime
    add_column :pedidos, :cantidad, :integer
  end
end
