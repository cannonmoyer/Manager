class Job < ActiveRecord::Base
	has_many :pages, dependent: :destroy
	has_many :receipts, dependent: :destroy
	
	belongs_to :customer
	belongs_to :user

end