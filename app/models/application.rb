class Application < ApplicationRecord 
  has_many :pet_applications
  has_many :pets, through: :pet_applications

  # def full_address
  #   "#{address}, #{city}, #{state}, #{zipcode}"
  # end
end