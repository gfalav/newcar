class Ofcar < ActiveRecord::Base
	has_many :movils
	has_many :turnos
end
