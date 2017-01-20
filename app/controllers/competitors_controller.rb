class CompetitorsController < AdminController
  include ContestControllerPart
  helper Shared::UsersHelper

  before_action :set_competitor, only: [:show, :edit, :update, :destroy]

  add_breadcrumb I18n.t('competitors.index.title'), ->(c) { c.contest_competitors_path(c.instance_variable_get(:@contest)) }

  # GET /competitors
  # GET /competitors.json
  def index
    authorize Competitor
    @competitors = policy_scope(@contest.competitors).all.all
  end

  # GET /competitors/1
  # GET /competitors/1.json
  def show
    add_breadcrumb @competitor
    authorize @competitor
  end

  # GET /competitors/new
  def new
    @competitor = @contest.competitors.build
    authorize @competitor
    add_breadcrumb I18n.t('app.crumbs.new')
  end

  # GET /competitors/1/edit
  def edit
    authorize @competitor
    add_breadcrumb @competitor
  end

  # POST /competitors
  # POST /competitors.json
  def create
    @competitor = @contest.competitors.build(competitor_params.merge(user: current_user))
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
    respond_to do |format|
      if @competitor.destroy
        format.html { redirect_to contest_competitors_url(@contest), notice: 'Competitor was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { render :show }
        format.json { render json: @competitor.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_competitor
    @competitor = Competitor.find(params[:id])
    @contest = @competitor.contest
  end

  def competitor_params
    params.require(:competitor).permit(:fio1, :fio2, :fio3, :dob, :location, :organization, :avatar, :description)
  end
end
