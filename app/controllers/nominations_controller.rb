class NominationsController < AdminController
  include ContestControllerPart

  before_action :set_nomination, only: [:show, :edit, :update, :destroy]

  add_breadcrumb I18n.t('nominations.index.title'), ->(c) { c.contest_nominations_path(c.instance_variable_get(:@contest)) }

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
    add_breadcrumb @nomination
  end

  # GET /nominations/new
  def new
    @nomination = @contest.nominations.build
    authorize @nomination
    add_breadcrumb I18n.t('app.crumbs.new')
  end

  # GET /nominations/1/edit
  def edit
    authorize @nomination
    add_breadcrumb @nomination
  end

  # POST /nominations
  # POST /nominations.json
  def create
    @nomination = @contest.nominations.build(nomination_params)
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
    respond_to do |format|
      if @nomination.destroy
        format.html { redirect_to contest_nominations_url(@contest), notice: 'Nomination was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { render :show }
        format.json { render json: @nomination.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_nomination
    @nomination = Nomination.find(params[:id])
    @contest = @nomination.contest
  end

  def nomination_params
    params.require(:nomination).permit(:title, :description)
  end
end
