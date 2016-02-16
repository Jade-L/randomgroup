class GroupesController < ApplicationController
  before_action :set_groupe, only: [:show, :edit, :update, :destroy]
  before_action :Gmin, only: [:Rand]

  # GET /groupes
  # GET /groupes.json
  def index
    @groupes = Groupe.all
    @personnes = Personne.all
  end

  # GET /groupes/1
  # GET /groupes/1.json
  def show
  end

  # GET /groupes/new
  def new
    @groupe = Groupe.new
  end

  # GET /groupes/1/edit
  def edit
  end

  # POST /groupes
  # POST /groupes.json
  def create
    @groupe = Groupe.new(groupe_params)

    respond_to do |format|
      if @groupe.save
        format.html { redirect_to root_path, notice: 'Groupe was successfully created.' }
        format.json { render :show, status: :created, location: @groupe }
      else
        format.html { render :new }
        format.json { render json: @groupe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groupes/1
  # PATCH/PUT /groupes/1.json
  def update
    respond_to do |format|
      if @groupe.update(groupe_params)
        format.html { redirect_to root_path, notice: 'Groupe was successfully updated.' }
        format.json { render :show, status: :ok, location: @groupe }
      else
        format.html { render :edit }
        format.json { render json: @groupe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groupes/1
  # DELETE /groupes/1.json
  def destroy
    @groupe.destroy
    respond_to do |format|
      format.html { redirect_to groupes_url, notice: 'Groupe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def Rand
    @personnes = Personne.all
    @groupes = Groupe.all

    maxByGroup = (@personnes.size / @groupes.size).ceil + 1
    @personnes.each do |personne|
      personne.group_id = nil
      personne.save
    end

    id_groupe = []
    @groupes.each do |groupe|
      id_groupe << groupe.id
    end

    @personnes.each do |i|
      random_groupe = id_groupe.sample
      i.group_id = random_groupe
      i.save
      if @personnes.where(group_id: random_groupe).size == maxByGroup
        id_groupe.delete(random_groupe)
      end
    end
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_groupe
      @groupe = Groupe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def groupe_params
      params.require(:groupe).permit(:nom, :salle, :tache)
    end

  def Gmin
    if Groupe.all.size < 2
      redirect_to root_path, notice: "Un minimun de 2 groupes est nécessaire."
    end
  end

end
