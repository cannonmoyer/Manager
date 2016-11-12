class Message < ApplicationRecord
	validates :description, presence: true

	belongs_to :customer
end
