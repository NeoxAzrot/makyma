class ContactMailer < ApplicationMailer
 
  #default from: 'makyma@notification'
 
  def contact_form(contact)
    @contact = contact
    #@to = 'contact@makyma.org'
    @to = 'makymaorg@gmail.com'
 
    mail( to: @to, 
          reply_to: @contact.email,
          subject: @contact.subject
        )
  end
end