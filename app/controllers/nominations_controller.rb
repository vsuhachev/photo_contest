class NominationsController < ApplicationController
  include ContestControllerPart

  before_action :set_nomination, only: [:show, :edit, :update, :destroy]

  # GET /nominations
  # GET /nominations.json
  def index
    authorize Nomination
    @nominations = policy_scope(@contest.nominations).all
  end

  # GET /nominations/1
  # GET /nominations/1.json
  def show
    authorize @nomination
  end

  # GET /nominations/new
  def new
    @nomination = policy_scope(@contest.nominations).build
    authorize @nomination
  end

  # GET /nominations/1/edit
  def edit
    authorize @nomination
  end

  # POST /nominations
  # POST /nominations.json
  def create
    @nomination = policy_scope(@contest.nominations).build(nomination_params)
    authorize @nomination

    respond_to do |format|
      if @nomination.save
        format.html { redirect_to @nomination, notice: 'Nomination was successfully created.' }
        format.json { render :show, status: :created, location: @nomination }
      else
        format.html { render :new }
        format.json { render json: @nomination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nominations/1
  # PATCH/PUT /nominations/1.json
  def update
    authorize @nomination
    respond_to do |format|
      if @nomination.update(nomination_params)
        format.html { redirect_to @nomination, notice: 'Nomination was successfully updated.' }
        format.json { render :show, status: :ok, location: @nomination }
      else
        format.html { render :edit }
        format.json { render json: @nomination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nominations/1
  # DELETE /nominations/1.json
  def destroy
    authorize @nomination
    @nomination.destroy
    respond_to do |format|
      format.html { redirect_to contest_nominations_url(@contest), notice: 'Nomination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_nomination
    @nomination = Nomination.find(params[:id])
    @contest = @nomination.contest
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def nomination_params
    params.require(:nomination).permit(:title, :description)
  end
end
