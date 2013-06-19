# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

class Role < ActiveRecord::Base
  # Include default devise modules. Others available are:
  validates :name, :presence => true, :uniqueness => true
  
  has_and_belongs_to_many :users

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :description   
  
   HUMANIZED_ATTRIBUTES = {
    :name => 'Nome',
    :description => "Descrição"
   }

   def self.human_attribute_name(attr,options={})
     HUMANIZED_ATTRIBUTES[attr.to_sym] || super
   end 

  # Antes de salvar trata atributos em caixa alta ou baixa  
  before_validation :upcase_attr

  def upcase_attr
    attributes =  Role.new.attributes.keys
    attributes.each do |attr|
      unless self[attr.to_sym].blank?
        if attr == "name"
          self[attr.to_sym] = self[attr.to_sym].camelize
        end 
      end
    end
  end  
end	
