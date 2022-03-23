# Preview all emails at http://localhost:3000/rails/mailers/makyma_notice_mailer
class ContactMailerPreview < ActionMailer::Preview

  def contact_mailer_preview
    contact = Contact.new
    contact.name = "hugo"
    contact.email = "hugo.faugeroux@mmibordeaux.com"
    contact.subject = "Test Contact Objet"
    contact.body = "Test contact body"
    ContactMailer.contact_form(contact).deliver_now
  end

end
