class Patient < ActiveRecord::Base

	belongs_to :ward

	validates :name, presence: true
	validates :address, presence: true
	validates :age, presence: true
	validates :diagnosis, presence: true
	validates :status, presence: true
end
