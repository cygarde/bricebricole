class ChantiersController < ApplicationController

before_action :set_chantier, only: [:show, :edit, :update]

  def index
    @chantiers = Chantier.all
    @client = Client.new
  end

  def new
    @chantier = Chantier.new
    @client = Client.find(params[:client_id])
  end

  def create
    @chantier = Chantier.new(chantier_params)
    @chantier.user = current_user
    @client = Client.find(params[:client_id])
    @chantier.client = @client
    if @chantier.save
      redirect_to client_chantier_path(@chantier, @client)
    else
      render :new
    end
  end

  def show
  end

  def edit
    @client = Client.find(params[:client_id])


  end

  def update
    @chantier.user = current_user
    @client = Client.find(params[:client_id])
    @chantier.client = @client
    respond_to do |format|
      if @chantier.update(chantier_params)
        redirect_to client_chantier_path(@chantier, @client)
      else
        render :edit
      end
    end
  end

private

  def set_chantier
    @chantier = Chantier.find(params[:id])
  end

  def chantier_params
    params.require(:chantier).permit(:nom, :reference, :description, :statut, :priorite, :date_debut, :date_fin_estimee, :date_fin, :adresse, :montant_versement, :avancement)
  end

end
