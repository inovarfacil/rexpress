# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  validates :password, :presence => true
  validates :password_confirmation, :presence => true
  validates :role_ids, :presence => true
  validates :username, :presence => true
    
  #Associações
  has_and_belongs_to_many :roles
  
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :username, :password_confirmation, :remember_me, :role_ids

   HUMANIZED_ATTRIBUTES = {
     :email => "Email",
     :username => "Nome",
     :password => "Senha",
     :password_confirmation => "Confirmação de Senha",
     :remember_me => "Continuar conectado",
     :role_ids => "Permissão"
   }

  #metodo para enviar email
  after_save :enviar_email

   def self.human_attribute_name(attr,options={})
     HUMANIZED_ATTRIBUTES[attr.to_sym] || super
   end  

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end   

  # Antes de salvar trata atributos em caixa alta ou baixa  
  before_validation :upcase_attr
  before_validation :downcase_attr

  def upcase_attr
    attributes =  User.new.attributes.keys
    attributes.each do |attr|
      unless self[attr.to_sym].blank?
        if attr == "username"
          self[attr.to_sym] = self[attr.to_sym].camelize
        end 
      end
    end
  end  
  
  def downcase_attr
    attributes =  User.new.attributes.keys
    attributes.each do |attr|
      unless self[attr.to_sym].blank?
        if attr == "email"
          self[attr.to_sym] = self[attr.to_sym].downcase
        end 
      end
    end
  end

  def enviar_email
    
  end

end
