class DashboardController < ApplicationController
  def dashboard
    @user = current_user
    @chantiers = @user.chantiers.count
    @chantiersencours = @user.chantiers.where(statut:'encours').count
    @chantiersavenir = @user.chantiers.where(statut:'avenir').count
    @meteodashboard = @user.adresse
    #@taches = @user.taches.count
    #@tachesarealiser = Tache.where(realisation:false)

    #@tempsdispoartisan = @user.where(jours_travail:true)
    #@chargetravaildisp =


  end
end


    #jours_travail"
    #t.string "heure_debut_travail"
    #t.string "heure_fin_travail"
