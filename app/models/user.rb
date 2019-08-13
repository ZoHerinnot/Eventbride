class User < ApplicationRecord
	has_many :events ,through: :attendance 
	has_many :attendances
	

end
