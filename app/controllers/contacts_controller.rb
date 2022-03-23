class ContactsController < ApplicationController
  protect_from_forgery

  def new
    add_breadcrumb 'Contact'
    @contact = Contact.new
  end

  def create
    add_breadcrumb 'Contact'
    @contact = Contact.new contact_params
    if @contact.valid?
      ContactMailer.contact_form(@contact).deliver_now
      #redirect_to new_message_url
      flash[:notice] = "We have received your message and will be in touch soon!"
      render :confirm
    else
      flash[:notice] = "There was an error sending your message. Please try again."
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :subject, :email, :body)
  end

end
