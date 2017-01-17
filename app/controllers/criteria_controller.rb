class CriteriaController < AdminController
  include ContestControllerPart

  before_action :set_criterion, only: [:show, :edit, :update, :destroy]

  add_breadcrumb I18n.t('criteria.index.title'), ->(c) { c.contest_criteria_path(c.instance_variable_get(:@contest)) }

  # GET /criteria
  # GET /criteria.json
  def index
    authorize Criterion
    @criteria = policy_scope(@contest.criteria).all
  end

  # GET /criteria/1
  # GET /criteria/1.json
  def show
    add_breadcrumb @criterion
    authorize @criterion
  end

  # GET /criteria/new
  def new
    add_breadcrumb I18n.t('app.crumbs.new')
    @criterion = @contest.criteria.build
    authorize @criterion
  end

  # GET /criteria/1/edit
  def edit
    add_breadcrumb @criterion
    authorize @criterion
  end

  # POST /criteria
  # POST /criteria.json
  def create
    @criterion = @contest.criteria.build(criterion_params)
    authorize @criterion

    respond_to do |format|
      if @criterion.save
        format.html { redirect_to @criterion, notice: 'Criterion was successfully created.' }
        format.json { render :show, status: :created, location: @criterion }
      else
        format.html { render :new }
        format.json { render json: @criterion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /criteria/1
  # PATCH/PUT /criteria/1.json
  def update
    authorize @criterion
    respond_to do |format|
      if @criterion.update(criterion_params)
        format.html { redirect_to @criterion, notice: 'Criterion was successfully updated.' }
        format.json { render :show, status: :ok, location: @criterion }
      else
        format.html { render :edit }
        format.json { render json: @criterion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /criteria/1
  # DELETE /criteria/1.json
  def destroy
    authorize @criterion
    @criterion.destroy
    respond_to do |format|
      format.html { redirect_to contest_criteria_url(@contest), notice: 'Criterion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_criterion
    @criterion = Criterion.find(params[:id])
    @contest = @criterion.contest
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def criterion_params
    params.require(:criterion).permit(:title, :description)
  end
end
