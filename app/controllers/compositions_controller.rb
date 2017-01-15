class CompositionsController < ApplicationController
  include ContestControllerPart

  before_action :set_composition, only: [:show, :edit, :update, :destroy]

  add_breadcrumb I18n.t('contests.index.title'), :contests_path
  add_breadcrumb ->(c) { c.instance_variable_get(:@contest) }, ->(c) { c.contest_path(c.instance_variable_get(:@contest)) }
  add_breadcrumb I18n.t('compositions.index.title'), ->(c) { c.contest_compositions_path(c.instance_variable_get(:@contest)) }

  # GET /compositions
  # GET /compositions.json
  def index
    authorize Composition
    @compositions = policy_scope(Composition).all
  end

  # GET /compositions/1
  # GET /compositions/1.json
  def show
    authorize @composition
    add_breadcrumb @composition
  end

  # GET /compositions/new
  def new
    @composition = @contest.compositions.build
    authorize @composition
    add_breadcrumb I18n.t('app.crumbs.new')
  end

  # GET /compositions/1/edit
  def edit
    authorize @composition
    add_breadcrumb @composition
  end

  # POST /compositions
  # POST /compositions.json
  def create
    @composition = @contest.compositions.build(composition_params)
    authorize @composition

    respond_to do |format|
      if @composition.save
        format.html { redirect_to composition_url(@composition), notice: 'Contest photo was successfully created.' }
        format.json { render :show, status: :created, location: @composition }
      else
        format.html { render :new }
        format.json { render json: @composition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compositions/1
  # PATCH/PUT /compositions/1.json
  def update
    authorize @composition
    respond_to do |format|
      if @composition.update(composition_params)
        format.html { redirect_to composition_url(@composition), notice: 'Contest photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @composition }
      else
        format.html { render :edit }
        format.json { render json: @composition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compositions/1
  # DELETE /compositions/1.json
  def destroy
    authorize @composition
    @composition.destroy
    respond_to do |format|
      format.html { redirect_to contest_compositions_url(@contest), notice: 'Contest photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_composition
    @composition = Composition.find(params[:id])
    @contest = @composition.contest
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def composition_params
    params.require(:composition).permit(:competitor_id, :photo_id, :nomination_id)
  end
end
