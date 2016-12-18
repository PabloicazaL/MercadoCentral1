class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.references :user, index: true, foreign_key: true
      t.references :comida, index: true, foreign_key: true
      t.datetime :fecha_pedido
      t.integer :precio
      t.integer :total

      t.timestamps null: false
    end
  end
end
