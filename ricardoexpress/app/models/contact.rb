# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  slug       :string(255)
#  title      :string(255)
#  name       :string(255)
#  phone      :string(255)
#  email      :string(255)
#  subject    :string(255)
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contact < ActiveRecord::Base
  #Validações


  # Setup accessible (or protected) attributes for your model
  attr_accessible :slug, :title, :name, :phone, :email, :subject, :message

   HUMANIZED_ATTRIBUTES = {
     :slug => "Slug",
     :title => "Titulo",
     :name => "Nome",
     :phone => "Telefone",
     :email => "E-mail",
     :subject => "Assunto",     
     :message => "Mensagem"
   }

   def self.human_attribute_name(attr,options={})
     HUMANIZED_ATTRIBUTES[attr.to_sym] || super
   end  

  # Antes de salvar trata atributos em caixa alta ou baixa  
  before_validation :upcase_attr
  before_validation :downcase_attr

  def upcase_attr
    attributes =  Contact.new.attributes.keys
    attributes.each do |attr|
      unless self[attr.to_sym].blank?
        if attr == "name"
          self[attr.to_sym] = self[attr.to_sym].camelize
        end
        if attr == "subject"
          self[attr.to_sym] = self[attr.to_sym].camelize
        end
        if attr == "message"
          self[attr.to_sym] = self[attr.to_sym].camelize
        end 
      end
    end
  end  
  
  def downcase_attr
    attributes =  Contact.new.attributes.keys
    attributes.each do |attr|
      unless self[attr.to_sym].blank?
        if attr == "email"
          self[attr.to_sym] = self[attr.to_sym].downcase
        end 
      end
    end
  end    
end
