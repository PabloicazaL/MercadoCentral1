class CreateComidas < ActiveRecord::Migration
  def change
    create_table :comidas do |t|
      t.string :tipo_comida
      t.string :tipo_cocina
      t.integer :porciones
      t.string :comida_nombre
      t.text :resumen
      t.boolean :es_alergia_habas
      t.boolean :es_alergia_habas_soya
      t.boolean :es_alergia_nueces
      t.boolean :es_alergia_huevos
      t.boolean :es_alergia_mariscos
      t.boolean :es_alergia_gluten
      t.boolean :es_alergia_pescado
      t.boolean :es_alergia_sesamo
      t.boolean :es_diabetes
      t.boolean :es_halal
      t.boolean :es_intolerante_lactosa
      t.boolean :es_kosher
      t.boolean :es_nocerdo
      t.boolean :es_organica
      t.boolean :es_singluten
      t.boolean :es_vegana
      t.boolean :es_vegetariana
      t.integer :precio
      t.integer :tiempo_anticipacion
      t.boolean :es_servicio_domicilio
      t.integer :rango
      t.string :direccion
      t.boolean :active
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
