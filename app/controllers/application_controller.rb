class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nom, :prenom, :nom_societe, :numero_siret, :numero_tva, :adresse, :jours_travail, :heure_debut_travail, :heure_fin_travail])
  end
end
