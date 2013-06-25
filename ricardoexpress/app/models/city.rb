# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  state_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class City < ActiveRecord::Base
  # Proteção contra mass-assignment
  attr_accessible :state_id, :name
  
  # Belongs to association
  belongs_to :state
  
  # Validações
  validates :state_id, :presence => true
  validates :name,      :presence => true
  validates :name,      :uniqueness => true
  
  # Rótulo dos atributos
  HUMANIZED_ATTRIBUTES = {
    :state_id => "Estado",
    :name => "Nome"
  }
  
  def self.human_attribute_name(attr, options={})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
end
