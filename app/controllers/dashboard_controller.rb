class DashboardController < ApplicationController
  def dashboard
    @user = current_user
    @chantiers = @user.chantiers.count
    @chantiersencours = @user.chantiers.where(statut:'encours').count
    @chantiersavenir = @user.chantiers.where(statut:'avenir').count
    @meteodashboard = @user.adresse
    #@taches = Tache.all.where(user_id:@user.id)
    #@taches = @user.taches.count
    #@tachesarealiser = Tache.where(realisation:false)

    #@tempsdispoartisan = @user.where(jours_travail:true)
    #@chargetravaildisp =
    #methode charge de travail
    @from_date = DateTime.now.beginning_of_week
    @to_date = DateTime.now.end_of_week
    @taches_totales_semaine = []
    @user.chantiers.each do |chantier|
      chantier.taches.each do |tache|
        if tache.date_debut >= @from_date && tache.date_debut <= @to_date
          @taches_totales_semaine << tache
        end
      end
    end
    @temps_taches_totale_semaine = 0
    @taches_totales_semaine.each do |tache|
      @duree_tache = ((tache.date_fin - tache.date_debut) / 3600).round
      @temps_taches_totale_semaine += @duree_tache
      @taches_totales_semaine
    end
    @duree_travail_jour = @user.heure_fin_travail - @user.heure_debut_travail
    #@jours_travailles = @user.jours_travail.count
    @jours_travailles = 5
    @duree_travail_semaine = @jours_travailles * @duree_travail_jour
    @charge_travail_pourcentage_semaine = ((@temps_taches_totale_semaine * 100) / @duree_travail_semaine).round
    @charge_travail_pourcentage_semaine = 80

    #methode tache en retard
    @taches_retard = []
    @datenow = DateTime.now
    @user.chantiers.each do |chantier|
      chantier.taches.each do |tache|
        if tache.date_fin < @datenow
          @taches_retard << tache
          @taches_retard
        end
      end
    end
  end
end
