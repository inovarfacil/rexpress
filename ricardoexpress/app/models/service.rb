# == Schema Information
#
# Table name: services
#
#  id             :integer          not null, primary key
#  slug           :string(255)
#  name           :string(255)
#  title          :string(255)
#  description    :text
#  servicetype_id :integer
#  circuit_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  circuit_name   :string(255)
#  resumo         :text
#  imagem         :string(255)
#

class Service < ActiveRecord::Base
  #Associacoes
  has_many :servicetypes
  has_many :circuits

  #Validações
  validates :slug, :presence => true
  validates :name, :presence => true
  validates :title, :presence => true
  validates :description, :presence => true
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :slug, :title, :name, :description, :servicetype_id, :circuit_id, :circuit_name, :resumo, :imagem, :remote_imagem_url

  #Up load de Imagens
  mount_uploader :imagem, ImageUploader

   HUMANIZED_ATTRIBUTES = {
     :slug => "Slug",
     :title => "Titulo",
     :name => "Nome",
     :description => "Descrição",
     :servicetype_id => "Tipo do serviço",
     :circuit_id => "Rotas",
     :resumo => "Resumo",
     :imagem => "Imagem",
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
        if attr == "title"
          self[attr.to_sym] = self[attr.to_sym].camelize
        end
      end
    end
  end
end
