class ContactMailer < ApplicationMailer
 
  default from: 'makyma@notification'
 
  def contact_form(contact)
    @contact = contact
    @to = 'contact@makyma.org'
 
    mail(to: @to, subject: @contact.subject)
  end
 
end