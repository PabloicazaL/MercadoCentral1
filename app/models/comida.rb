class Comida < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :pedidos
  has_many :reviews

  geocoded_by :direccion
  after_validation :geocode, if: :direccion_changed?

  validates :tipo_comida, presence: true
  validates :tipo_cocina, presence: true
  validates :porciones, presence: true
  validates :comida_nombre, presence: true, length: {maximum: 50}
  validates :resumen, presence: true, length: {maximum: 500}
  validates :precio, presence: true
  validates :es_servicio_domicilio, presence: true
  validates :direccion, presence: true


  def show_first_photo(size)
    if self.photos.length == 0
    'http://foodandtravel.mx/home/wp-content/uploads/2015/09/tacos.jpg'
    elsif (size == :thumb) || (size == :medium)
      self.photos[0].image.url(size)
    else
      self.photos[0].image
    end
  end

  def average_rating 
    reviews.count == 0 ? 0 : reviews.average(:star).round(2)
    
  end
end
