class CommentairesController < ApplicationController
  def new
    @client = Client.find(params[:client_id])
    @commentaire = Commentaire.new
  end

  def create
    @commentaire = Commentaire.new(commentaire_params)
    @client = Client.find(params[:client_id])
    @commentaire.client = @client
    if @commentaire.save
      redirect_to client_path(@client)
    end
  end

  private

  def commentaire_params
    params.require(:commentaire).permit(:content)
  end
end

