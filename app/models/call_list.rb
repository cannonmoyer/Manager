class CallList < ActiveRecord::Base
	validates :name, presence: true
	validates :phone, format: {with: /\A(^$|([0-9]{3,3}-[0-9]{3,3}-[0-9]{4,4})(\sext\s\d*)?)/, message: "Only allow valid phone number" }

end
