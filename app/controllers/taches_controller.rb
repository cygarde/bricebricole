class TachesController < ApplicationController


  #Montre toute les tâches
  def index
    @taches = Tache.all
  end

  #Montre la tache précise
  def show
    @tache = Tache.find[params:id]
  end


 #Montre un nouveau formulaire

  def new


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



end
