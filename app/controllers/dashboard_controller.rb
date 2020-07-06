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
      @duree_tache = ((tache.heure_fin - tache.heure_debut) / 3600).round
      @temps_taches_totale_semaine += @duree_tache
    end
    #@tps_w_journalier = @user.heure_debut_travail - @user.heure_fin_travail
    #@jours_travailles = @user.jours_travail.count
    #@tps_total_user = @jours_travailles * @tpswjournalier
    #@charge_travail_pourcentage = (@temps_total_taches_totalesemaine * 100) / @tpstotaluser
  end
end
