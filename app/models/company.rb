class Company < ApplicationRecord
	belongs_to :employeer,optional:true
end
