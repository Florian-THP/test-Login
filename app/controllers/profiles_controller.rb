class ProfilesController < ApplicationController
  before_action :set_user

  def show
    # La logique pour afficher le profil peut être ajoutée ici
  end

  private

  def set_user
    @user = User.find_by(id: session[:user_id])
    
    unless @user
      flash[:alert] = "Vous devez être connecté pour voir votre profil."
      redirect_to new_session_path  # Redirige vers la page de connexion si l'utilisateur n'est pas connecté
    end
  end
end
