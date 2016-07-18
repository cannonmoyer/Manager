class Customer < ActiveRecord::Base
	validates :name, presence: true
	validates :phone_one, format: {with: /\A(^$|([0-9]{3,3}-[0-9]{3,3}-[0-9]{4,4})(\sext\s\d*)?)/, message: "Only allow valid phone number" }
	validates :phone_two, format: {with: /\A(^$|([0-9]{3,3}-[0-9]{3,3}-[0-9]{4,4})(\sext\s\d*)?)/, message: "Only allow valid phone number" }
	validates :phone_three, format: {with: /\A(^$|([0-9]{3,3}-[0-9]{3,3}-[0-9]{4,4})(\sext\s\d*)?)/, message: "Only allow valid phone number" }
	validates :phone_four, format: {with: /\A(^$|([0-9]{3,3}-[0-9]{3,3}-[0-9]{4,4})(\sext\s\d*)?)/, message: "Only allow valid phone number" }
	validates :fax, format: {with: /\A(^$|([0-9]{3,3}-[0-9]{3,3}-[0-9]{4,4})(\sext\s\d*)?)/, message: "Only allow valid fax number" }
	
	has_many :jobs, dependent: :destroy
	has_many :certificates, dependent: :destroy
	has_many :messages, dependent: :destroy
end
