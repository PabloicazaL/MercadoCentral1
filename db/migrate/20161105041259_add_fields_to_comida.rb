class AddFieldsToComida < ActiveRecord::Migration
  def change
    add_column :comidas, :latitude, :float
    add_column :comidas, :longitude, :float
  end
end
