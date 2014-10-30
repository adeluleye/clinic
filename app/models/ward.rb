class Ward < ActiveRecord::Base

	has_many :patients

	validates :ward_name, presence: true
	
	
end
