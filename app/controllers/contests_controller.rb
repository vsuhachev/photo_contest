class ContestsController < AdminController
  include StatefulController

  before_action :set_contest, only: [:show, :edit, :update, :destroy, :transition]

  add_breadcrumb I18n.t('contests.index.title'), :contests_path

  # GET /contests
  # GET /contests.json
  def index
    authorize Contest
    @contests = policy_scope(Contest).all
  end

  # GET /contests/1
  # GET /contests/1.json
  def show
    add_breadcrumb @contest
    authorize @contest
  end

  # GET /contests/new
  def new
    add_breadcrumb I18n.t('app.crumbs.new')
    @contest = Contest.new
    authorize @contest
  end

  # GET /contests/1/edit
  def edit
    add_breadcrumb @contest
    authorize @contest
  end

  # POST /contests
  # POST /contests.json
  def create
    @contest = Contest.new(contest_params)
    authorize @contest

    respond_to do |format|
      if @contest.save
        format.html { redirect_to @contest, notice: 'Contest was successfully created.' }
        format.json { render :show, status: :created, location: @contest }
      else
        format.html { render :new }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contests/1
  # PATCH/PUT /contests/1.json
  def update
    authorize @contest
    respond_to do |format|
      if @contest.update(contest_params)
        format.html { redirect_to @contest, notice: 'Contest was successfully updated.' }
        format.json { render :show, status: :ok, location: @contest }
      else
        format.html { render :edit }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contests/1
  # DELETE /contests/1.json
  def destroy
    authorize @contest
    respond_to do |format|
      if @contest.destroy
        format.html { redirect_to contests_url, notice: 'Contest was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { render :show }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  def stateful_model
    @contest
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contest
    @contest = Contest.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contest_params
    params.require(:contest).permit(:title, :description)
  end
end
