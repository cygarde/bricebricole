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

    # Charge de travail
    @from_date = DateTime.now.beginning_of_week
    @to_date = DateTime.now.end_of_week
    @taches_totales_semaine = []
    @user.chantiers.each do |chantier|
      chantier.taches.each do |tache|
        if tache.date_debut && tache.date_fin
          if tache.date_debut >= @from_date && tache.date_debut <= @to_date
            @taches_totales_semaine << tache
          end
        end
      end
    end
    @temps_taches_totale_semaine = 0
    @taches_totales_semaine.each do |tache|
      @duree_tache = ((tache.date_fin - tache.date_debut) / 3600).round
      @temps_taches_totale_semaine += @duree_tache
      @taches_totales_semaine
    end

    # Si le user a bien une heure_debut_travail et une heure_fin_travail
    if @user.heure_debut_travail && @user.heure_fin_travail
      @duree_travail_jour = @user.heure_fin_travail - @user.heure_debut_travail
      #@jours_travailles = @user.jours_travail.count
      @jours_travailles = 5
      @duree_travail_semaine = @jours_travailles * @duree_travail_jour
    end

    if @duree_travail_semaine
      @charge_travail_pourcentage_semaine = ((@temps_taches_totale_semaine * 100) / @duree_travail_semaine).round
      @charge_travail_pourcentage_semaine = 80
    end

    # Taches en retard
    @taches_retard = []
    @datenow = DateTime.now
    @user.chantiers.each do |chantier|
      chantier.taches.each do |tache|
        # Si la tache a bien une date_fin
        if tache.date_fin
          if tache.date_fin < @datenow
            @taches_retard << tache
            @taches_retard
          end
        end
      end
    end

    #taches du jour
    @taches_jour = []
    @datejour = Date.today
    @user.chantiers.each do |chantier|
      chantier.taches.each do |tache|
        if tache.date_debut
          if tache.date_debut.to_date == @datejour
            @taches_jour << tache
            @taches_jour
          end
        end
      end
    end

    #decompte tache
    @taches_minutes_depasse = 0
    @tache_minutes_restantes = 0
    @datejournow = DateTime.now
  end
end
