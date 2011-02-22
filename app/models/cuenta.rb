class Cuenta < ActiveRecord::Base
	has_ancestry
	has_many :actividads
end
