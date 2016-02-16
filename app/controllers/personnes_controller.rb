class PersonnesController < ApplicationController
  before_action :set_personne, only: [:show, :edit, :update, :destroy]

  # GET /personnes
  # GET /personnes.json
  def index
    @personnes = Personne.all
  end

  # GET /personnes/1
  # GET /personnes/1.json


  # GET /personnes/new


  # GET /personnes/1/edit


  # POST /personnes
  # POST /personnes.json


  # PATCH/PUT /personnes/1
  # PATCH/PUT /personnes/1.json


  # DELETE /personnes/1
  # DELETE /personnes/1.json


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personne
      @personne = Personne.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personne_params
      params.require(:personne).permit(:nom, :email, :tel, :group_id, :sensei)
    end
end
