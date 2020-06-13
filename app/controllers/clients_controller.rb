class ClientsController < ApplicationController
before_action :set_client, only: [:show, :edit]

  def index
    @clients = Client.all
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
  end

  def edit
  end

  def update
    respond_to do |format|
      if @client.update(client_params)
        redirect_to @client
      else
        render :edit
      end
    end
  end

private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:nom, :prenom, :telephone_1, :telephone_2, :email, :adresse, :categorie, :information, :fidelite, :entreprise)
  end

end
