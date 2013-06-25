# == Schema Information
#
# Table name: servicetypes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  prince     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Servicetype < ActiveRecord::Base
  belongs_to :service
  
  #Validações
  validates :name, :presence => true
  validates :prince, :presence => true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :prince

   HUMANIZED_ATTRIBUTES = {
     :name => "Nome",
     :prince => "Preço"
   }

   def self.human_attribute_name(attr,options={})
     HUMANIZED_ATTRIBUTES[attr.to_sym] || super
   end  

  # Antes de salvar trata atributos em caixa alta ou baixa  
  before_validation :upcase_attr

  def upcase_attr
    attributes =  Service.new.attributes.keys
    attributes.each do |attr|
      unless self[attr.to_sym].blank?
        if attr == "name"
          self[attr.to_sym] = self[attr.to_sym].camelize
        end
      end
    end
  end
end
