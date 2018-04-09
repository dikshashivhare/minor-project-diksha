class JobCategory < ApplicationRecord
	has_many :jobs,dependent: :destroy
end
