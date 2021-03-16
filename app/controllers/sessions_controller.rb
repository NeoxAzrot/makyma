class SessionsController < Devise::SessionsController

  def new
    add_breadcrumb 'Se connecter'
    super
  end
  
end