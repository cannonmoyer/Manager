class CustomerMailer < ApplicationMailer
	default from: 'receipts@finaltouchsecurity.com'
 
	def email_receipt(receipt)
		@receipt = receipt
		mail(to: @receipt.email, subject: 'Receipt - The Final Touch Security, LLC')
	end
end
