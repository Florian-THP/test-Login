# app/helpers/sessions_helper.rb
module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])  # Utilisation de la variable d'instance pour la performance
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil  # Réinitialiser @current_user
  end

  def logged_in?
    !current_user.nil?
  end
end
