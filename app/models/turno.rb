class Turno < ActiveRecord::Base
	belongs_to :movil
	belongs_to :ofcar
	belongs_to :tturno
end
