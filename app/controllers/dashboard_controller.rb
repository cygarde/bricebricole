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

    #@from_date = DateTime.now.beginning_of_week
    #@to_date = DateTime.now.end_of_week
    #@tachestotalessemaine = @taches.where("date_debut >= #{@from_date} AND date_debut <= #{@to_date}")
    #@tachestotalessemaine = @user.@taches.where("date_debut >= #{@from_date} AND date_debut <= #{@to_date}")
    #@tempstotaltachestotalesemaine = 0
    #@tachestotalessemaine.each do |tps|
    #  dureetotaletache = tps.heure_fin - tps.heure_debut
    #  @tempstotaltachestotalesemaine += dureetotaletache
    #end
    #@tpswjournalier = @user.heure_debut_travail - @user.heure_fin_travail
    #@jourstravaillés = @user.jours_travail.count
    #@tpstotaluser = @jourstravaillés * @tpswjournalier
    #@chargetravailpourcentage = (@tempstotaltachestotalesemaine * 100) / @tpstotaluser
  end
end
