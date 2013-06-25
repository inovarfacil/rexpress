# == Schema Information
#
# Table name: managements
#
#  id          :integer          not null, primary key
#  site_name   :string(255)
#  tagline     :string(255)
#  description :text
#  keywords    :string(255)
#  icon        :string(255)
#  logo        :string(255)
#  facebook    :string(255)
#  twitter     :string(255)
#  linkedin    :string(255)
#  youtube     :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Management < ActiveRecord::Base
  # Include default devise modules. Others available are:
  validates :site_name, :presence => true
  validates :tagline, :presence => true
  validates :description, :presence => true
  validates :keywords, :presence => true
  validates :icon, :presence => true
  validates :logo, :presence => true
  validates :facebook, :presence => true
  validates :twitter, :presence => true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :site_name, :tagline, :description, :keywords, :icon, :logo, :facebook, :twitter, :linkedin, :youtube,
                  :remote_icon_url, :remote_logo_url

  #Up load de Imagens
  mount_uploader :icon, ImageUploader
  mount_uploader :logo, ImageUploader

   HUMANIZED_ATTRIBUTES = {
     :site_name => "Nome do site",
     :tagline => "Tagline",
     :description => "Descrição",
     :keywords => "Palavras chaves",
     :icon => "Icone",
     :logo => "Logo",
     :facebook => "Facebook",
     :twitter => "Twitter",
     :linkedin => "Linkedin",
     :youtube => "Youtube"

   }

   def self.human_attribute_name(attr,options={})
     HUMANIZED_ATTRIBUTES[attr.to_sym] || super
   end  

  # Antes de salvar trata atributos em caixa alta ou baixa  
  before_validation :upcase_attr
  before_validation :downcase_attr

  def upcase_attr
    attributes =  Management.new.attributes.keys
    attributes.each do |attr|
      unless self[attr.to_sym].blank?
        if attr == "site_name"
          self[attr.to_sym] = self[attr.to_sym].camelize
        end 
      end
    end
  end  
  
  def downcase_attr
    attributes =  Management.new.attributes.keys
    attributes.each do |attr|
      unless self[attr.to_sym].blank?
        if attr == "tagline"
          self[attr.to_sym] = self[attr.to_sym].downcase
        end 
        if attr == "keywords"
          self[attr.to_sym] = self[attr.to_sym].downcase
        end
        if attr == "facebook"
          self[attr.to_sym] = self[attr.to_sym].downcase
        end
        if attr == "twitter"
          self[attr.to_sym] = self[attr.to_sym].downcase
        end
        if attr == "linkedin"
          self[attr.to_sym] = self[attr.to_sym].downcase
        end
        if attr == "youtube"
          self[attr.to_sym] = self[attr.to_sym].downcase
        end
      end
    end
  end
end
