class Review < ActiveRecord::Base
  belongs_to :comida
  belongs_to :user
end
