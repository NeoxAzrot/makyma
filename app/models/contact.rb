class Contact
  include ActiveModel::Model
  
  attr_accessor :name, :subject, :email, :body

  validates :email, 
    :presence => :true,
    :format => { 
      :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
      :message => "Ton adresse mail ne semble pas valide"
    }
  validates :name, :subject, :body, :presence => :true
 
end