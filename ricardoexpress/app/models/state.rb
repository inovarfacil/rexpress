# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  sigla      :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class State < ActiveRecord::Base
  # Proteção contra mass-assignment
  attr_accessible :sigla, :name
  
  # Has many association
  has_many :cities
  
  # Validações
  validates :sigla, :presence => true
  validates :sigla, :uniqueness => true
  validates :name,  :presence => true
  validates :name,  :uniqueness => true
  
  # Rótulos para atributos
  HUMANIZED_ATTRIBUTES = {
    :sigla => "Sigla",
    :name => "Nome"
  }
  
  def self.human_attribute_name(attr, options={})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
end
