class Message < ActiveRecord::Base
	validates :description, presence: true

	belongs_to :customer
end
