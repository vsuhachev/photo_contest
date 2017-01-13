class JurorsController < ApplicationController
  include ContestControllerPart

  skip_before_action :set_contest, only: [:index]

  before_action :set_juror, only: [:show, :edit, :update, :destroy]

  # GET /jurors
  # GET /jurors.json
  def index
    authorize Juror
    set_contest if params[:contest_id]
    @jurors = policy_scope(@contest&.jurors || Juror).all
  end

  # GET /jurors/1
  # GET /jurors/1.json
  def show
    authorize @juror
  end

  # GET /jurors/new
  def new
    @juror = policy_scope(@contest.jurors).build
    authorize @juror
  end

  # GET /jurors/1/edit
  def edit
    authorize @juror
  end

  # POST /jurors
  # POST /jurors.json
  def create
    @juror = policy_scope(@contest.jurors).build(permitted_attributes(Juror))
    authorize @juror

    respond_to do |format|
      if @juror.save
        format.html { redirect_to @juror, notice: 'Juror was successfully created.' }
        format.json { render :show, status: :created, location: @juror }
      else
        format.html { render :new }
        format.json { render json: @juror.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jurors/1
  # PATCH/PUT /jurors/1.json
  def update
    authorize @juror
    respond_to do |format|
      if @juror.update(permitted_attributes(@juror))
        format.html { redirect_to @juror, notice: 'Juror was successfully updated.' }
        format.json { render :show, status: :ok, location: @juror }
      else
        format.html { render :edit }
        format.json { render json: @juror.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jurors/1
  # DELETE /jurors/1.json
  def destroy
    authorize @juror
    @juror.destroy
    respond_to do |format|
      format.html { redirect_to contest_jurors_url(@contest), notice: 'Juror was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_juror
    @juror = Juror.find(params[:id])
    @contest = @juror.contest
  end
end
