class CompetitorsController < ApplicationController
  before_action :set_competitor, only: [:show, :edit, :update, :destroy]

  add_breadcrumb I18n.t('competitors.index.title'), :competitors_path

  # GET /competitors
  # GET /competitors.json
  def index
    authorize Competitor
    @competitors = policy_scope(Competitor).all
  end

  # GET /competitors/1
  # GET /competitors/1.json
  def show
    add_breadcrumb @competitor
    authorize @competitor
  end

  # GET /competitors/new
  def new
    add_breadcrumb I18n.t('app.crumbs.new')
    @competitor = policy_scope(Competitor).build
    authorize @competitor
  end

  # GET /competitors/1/edit
  def edit
    add_breadcrumb @competitor
    authorize @competitor
  end

  # POST /competitors
  # POST /competitors.json
  def create
    @competitor = policy_scope(Competitor).build(competitor_params)
    authorize @competitor

    respond_to do |format|
      if @competitor.save
        format.html { redirect_to @competitor, notice: 'Competitor was successfully created.' }
        format.json { render :show, status: :created, location: @competitor }
      else
        format.html { render :new }
        format.json { render json: @competitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competitors/1
  # PATCH/PUT /competitors/1.json
  def update
    authorize @competitor
    respond_to do |format|
      if @competitor.update(competitor_params)
        format.html { redirect_to @competitor, notice: 'Competitor was successfully updated.' }
        format.json { render :show, status: :ok, location: @competitor }
      else
        format.html { render :edit }
        format.json { render json: @competitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competitors/1
  # DELETE /competitors/1.json
  def destroy
    authorize @competitor
    @competitor.destroy
    respond_to do |format|
      format.html { redirect_to competitors_url, notice: 'Competitor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_competitor
    @competitor = Competitor.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def competitor_params
    params.require(:competitor).permit(:fio1, :fio2, :fio3, :dob)
  end
end
