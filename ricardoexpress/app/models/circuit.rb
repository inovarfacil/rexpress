# == Schema Information
#
# Table name: circuits
#
#  id               :integer          not null, primary key
#  origin_city      :string(255)
#  destination_city :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  ce_id            :integer
#

class Circuit < ActiveRecord::Base
	#Associacoes
	belongs_to :service
	belongs_to :ce # Cidade Estado (CE)

	#Validações
	validates :origin_city, :presence => true
	validates :destination_city, :presence => true

	# Setup accessible (or protected) attributes for your model
	attr_accessible :destination_city, :origin_city, :ce_id

	HUMANIZED_ATTRIBUTES = {
		:origin_city => "Origem",
		:destination_city => "Destino",
	}

	def self.human_attribute_name(attr,options={})
		HUMANIZED_ATTRIBUTES[attr.to_sym] || super
	end  

end
