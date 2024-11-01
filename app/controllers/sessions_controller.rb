# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
    # Si l'utilisateur est déjà connecté, le redirige vers son profil
    if current_user
      redirect_to profile_path(current_user.id)
    else
      # Affiche le formulaire de connexion
    end
  end

  def create
    # Recherche l'utilisateur par email
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])  # Vérifie si le mot de passe est correct
      log_in(user)  # Utilisation de la méthode log_in définie dans le helper
      redirect_to profile_path(user.id)  # Redirige vers le profil de l'utilisateur
    else
      flash.now[:danger] = 'Invalid email/password combination'  # Affiche un message d'erreur
      render 'new'  # Rends le formulaire de connexion à nouveau
    end
  end

  def destroy
    log_out  # Déconnecte l'utilisateur
    redirect_to new_session_path  # Redirige vers la page de connexion
  end

  # Exemple d'utilisation de current_user dans une autre action
  def profile
    @user = current_user  # Récupère l'utilisateur connecté
    # Logique supplémentaire pour afficher le profil
  end
end
