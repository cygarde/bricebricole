class TachesController < ApplicationController
  before_action :set_tache, only: [:show, :edit, :update, :destroy]

  def index
    @taches = Tache.all
  end

  def show
  end

  def new
    @chantier = Chantier.find(params[:chantier_id])
    @tache = Tache.new
  end

  def create
    @tache = Tache.new(tache_params)
    @chantier = Chantier.find(params[:chantier_id])
   # @tache.user = current_user
    @tache.chantier = @chantier
    if @tache.save
      redirect_to chantier_taches_path(@tache)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @tache.user = current_user
    respond_to do |format|
      if @tache.update(tache_params)
        redirect_to chantier_taches_path(@tache, @chantier_id)
      else
        render :edit
      end
    end
  end

  def destroy
   @tache.destroy
   redirect_to chantiers_path
  end

  private

  def set_tache
    @tache = Tache.find(params[:id])
  end

  def tache_params
    params.require(:tache).permit(:objet, :description, :note, :priorite, :environnement,
      :date_debut, :date_fin, :categorie, :heure_debut, :heure_fin, :jalon_anomalie,
      :dependance, :equipement, :equipement_description, :realisation)
  end
end
