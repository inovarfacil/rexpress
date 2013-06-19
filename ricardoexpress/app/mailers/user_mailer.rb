class UserMailer < ActionMailer::Base
  default :from => "admin@inovarfacil.com"

  def novo_usuario(user)
    @user = user
    mail(:to => user.email,
         :subject => "Bem Vindo #{user.username}")
  end
end
