class ClientsController < ApplicationController
before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @categories = ["Particulier", "Entreprise"]
    @fidelites = ["VIP"]
    if (params[:categorie].present? || params[:fidelite].present? || params[:adresse].present?)
      query = "#{params[:categorie]} #{params[:fidelite]} #{params[:adresse]}"
      @clients = Client.global_search(query)
    else
      @clients = Client.all
    end
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    @client.user = current_user
    if @client.save
      redirect_to client_path(@client)
    else
      render :new
    end
  end

  def show
    @chantier = Chantier.new
    @chantiers = @client.chantiers
    @clients = Client.all
  end

  def edit
  end

  def update
#    respond_to do |format|
      if @client.update(client_params)
        redirect_to @client
      else
        render :edit
#      end
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path
  end

private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:nom, :prenom, :telephone_1, :telephone_2, :email, :adresse, :categorie, :information, :fidelite, :entreprise)
  end

end
