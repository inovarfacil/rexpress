# == Schema Information
#
# Table name: ces
#
#  id         :integer          not null, primary key
#  city       :string(255)
#  uf         :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ce < ActiveRecord::Base
  # Cidade Estado (CE)
  # Classe criada para mapear Cidade e Estado 
  
  # Proteção contra mass-assignment
  attr_accessible :city, :uf

  # Has many association
  has_many :circuits
  has_many :clients

  # Validações
  validates :city, :presence => true
  validates :uf, :presence => true

  # Rótulo dos atributos
  HUMANIZED_ATTRIBUTES = {
    :city => 'Cidade',
    :uf => 'Estado'
  }

  def self.human_attribute_name(attr, options={})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

end
