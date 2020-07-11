class ChantiersController < ApplicationController

before_action :set_chantier, only: [:show, :edit, :update]

  def index
    @statut = ["En cours", "En attente"]
    if (params[:statut].present?)
      @chantiers = Chantier.search_by_statut(params[:statut])
    else
      @chantiers = Chantier.all
    end
  end

  def new
    @chantier = Chantier.new
    @clients = Client.all
  end

  def create
    @client = Client.find(params[:chantier][:client_id])
    @chantier = Chantier.new(chantier_params)
    @chantier.user = current_user
    @chantier.client = @client
    if @chantier.save
      redirect_to chantier_path(@chantier)
    else
      render :new
    end
  end

  def show

   @chantier = Chantier.find(params[:id])
   @chantiers = Chantier.where.not(latitude: nil, longitude: nil)
   @markers = @chantiers.map do |chantier|
    {
      lat: chantier.latitude,
      lng: chantier.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { chantier: chantier })
    }
  end

  #pourcentage avancement chantier
  @taches_terminees = @chantier.taches.where(realisation: true).count
  @taches_nombre = @chantier.taches.count
    if @chantier.taches != []  && @taches_terminees
      @chantier_avancement = ((@taches_terminees).fdiv(@taches_nombre) * 100).round
  end
  end

  def edit
  end

  def update
    @chantier.user = current_user
 #   respond_to do |format|
      if @chantier.update(chantier_params)
        redirect_to chantier_path(@chantier, @client_id)
      else
        render :edit
      end
#   end
  end


private

  def set_chantier
    @chantier = Chantier.find(params[:id])
  end

  def chantier_params
    params.require(:chantier).permit(:nom, :client_id, :user_id, :reference, :description, :statut, :priorite, :date_debut, :date_fin_estimee, :date_fin, :adresse, :montant_versement, :avancement, :latitude, :longitude, photos: [])
    end
end

