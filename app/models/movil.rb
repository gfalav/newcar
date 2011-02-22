class Movil < ActiveRecord::Base
	has_many :personals
	has_one  :vehiculo
	belongs_to :ofcar
end
