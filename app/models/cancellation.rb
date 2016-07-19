class Cancellation < ActiveRecord::Base
	validates :landline_monitoring, presence: true
	validates :cell_monitoring, presence: true
	validates :landline_monitoring, numericality: { greater_than_or_equal_to: 0 }
	validates :cell_monitoring, numericality: { greater_than_or_equal_to: 0 }
	
	belongs_to :customer
end
