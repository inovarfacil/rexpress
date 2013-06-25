# == Schema Information
#
# Table name: abouts
#
#  id          :integer          not null, primary key
#  slug        :string(255)
#  title       :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class About < ActiveRecord::Base
	#Validações
	validates :slug, :presence => true
	validates :title, :presence => true
	validates :description, :presence => true

	# Setup accessible (or protected) attributes for your model
	attr_accessible :slug, :title, :description

	HUMANIZED_ATTRIBUTES = {
		:slug => "Slug",
		:title => "Titulo",     
		:description => "Descrição"
	}

	def self.human_attribute_name(attr,options={})
	 HUMANIZED_ATTRIBUTES[attr.to_sym] || super
	end 	
end

