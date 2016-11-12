class Receipt < ApplicationRecord
	validates :email, presence: true
	validates :information, presence: true
	belongs_to :job
end
