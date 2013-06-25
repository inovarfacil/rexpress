# == Schema Information
#
# Table name: slides
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image      :string(255)
#  background :string(255)
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Slide < ActiveRecord::Base
	#Validações
	validates :name, :presence => true
	validates :image, :presence => true
	validates :text, :presence => true	

	# Setup accessible (or protected) attributes for your model
	attr_accessible :name, :image, :text, :background, :remote_image_url, :remote_background_url

	#Up load de Imagens
	mount_uploader :image, ImageUploader
	mount_uploader :background, ImageUploader

	HUMANIZED_ATTRIBUTES = {
		:name => "Nome",
		:image => "Imagem",     
		:text => "Texto da Imagem",
		:background => "Fundo da Imagem"
	}

	def self.human_attribute_name(attr,options={})
	 HUMANIZED_ATTRIBUTES[attr.to_sym] || super
	end 

end
