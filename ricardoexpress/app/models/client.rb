# == Schema Information
#
# Table name: clients
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  phone        :string(255)
#  cellphone    :string(255)
#  address      :string(255)
#  email        :string(255)
#  city         :string(255)
#  observations :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Client < ActiveRecord::Base
  #Associacoes
  belongs_to :ce # Cidade Estado (CE)

  #Validações
  validates :name, :presence => true
  validates :phone, :presence => true
  validates :cellphone, :presence => true
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }  
  validates :city, :presence => true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :phone, :cellphone, :address, :email, :city, :observations, :ce_id

   HUMANIZED_ATTRIBUTES = {
     :name => "Nome",
     :phone => "Telefone",
     :cellphone => "Celular",
     :address => "Endereço",
     :city => "Cidade | Estado",
     :email => "E-mail",
     :observations => "Observações"
   }

   def self.human_attribute_name(attr,options={})
     HUMANIZED_ATTRIBUTES[attr.to_sym] || super
   end

  # Antes de salvar trata atributos em caixa alta ou baixa  
  before_validation :upcase_attr
  before_validation :downcase_attr

  def upcase_attr
    attributes =  Client.new.attributes.keys
    attributes.each do |attr|
      unless self[attr.to_sym].blank?
        if attr == "name"
          self[attr.to_sym] = self[attr.to_sym].camelize
        end
        if attr == "address"
          self[attr.to_sym] = self[attr.to_sym].camelize
        end
      end
    end
  end  
  
  def downcase_attr
    attributes =  Client.new.attributes.keys
    attributes.each do |attr|
      unless self[attr.to_sym].blank?
        if attr == "email"
          self[attr.to_sym] = self[attr.to_sym].downcase
        end 
      end
    end
  end    
      
end
