class Account < ApplicationRecord
	validates :line_number, presence: true
	validates :number, presence: true
	validates :number, numericality: { greater_than: 0 }
	#validates :line_number, uniqueness: { scope: :number }
end
