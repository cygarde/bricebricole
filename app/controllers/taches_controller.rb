class TachesController < ApplicationController
require 'date'

  #Montre toute les tâches du jour
  def index
    @dates = Date.new(2001)

  end

  #Montre la tache précise
  def show
  end


 #Montre un nouveau formulaire

  def new
    @tache = Tache.new

  end

#creer une taches

  def create

  end


  #Mes à jour la tâches
  def update


  end


  #editer le formulaire
  def edit



  end

  #supprimer une taches

  def destroy



  end




private

  def set_client
    @tache = Tache.find(params[:id])
  end

  def tache_params
    params.require(:tache).permit(:objet, :description, :note, :type, :priorite, :environnement, :date_debut, :date_fin, :heure_debut, :heure_fin, :jalon_anomalie, :dependance, :equipement, :equipement_description, :realisation)
  end

end


end
