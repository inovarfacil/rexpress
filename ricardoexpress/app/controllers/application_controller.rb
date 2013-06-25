class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :specify_layout
  
  def specify_layout
      if controller_name == 'abouts' && action_name == 'empresa' || controller_name == 'services' && action_name == 'servico' || controller_name == 'contacts' && action_name == 'contato'
        'site'
      elsif controller_name == "contacts" && action_name == "land"
        'land'
      else
        'application'
      end
  end
  
  def after_sign_in_path_for(resource_or_scope)
    admins_path
  end

  def after_sign_out_path_for(resource_or_scope)
    user_session_path
  end  
end
