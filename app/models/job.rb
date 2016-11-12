class Job < ApplicationRecord
	has_many :pages, dependent: :destroy
	has_many :receipts, dependent: :destroy
	
	belongs_to :customer
	belongs_to :user

end
