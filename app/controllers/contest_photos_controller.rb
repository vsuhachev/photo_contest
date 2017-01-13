class ContestPhotosController < ApplicationController
  include ContestControllerPart

  before_action :set_contest_photo, only: [:show, :edit, :update, :destroy]

  # GET /contest_photos
  # GET /contest_photos.json
  def index
    authorize ContestPhoto
    @contest_photos = policy_scope(ContestPhoto).all
  end

  # GET /contest_photos/1
  # GET /contest_photos/1.json
  def show
    authorize @contest_photo
  end

  # GET /contest_photos/new
  def new
    @contest_photo = @contest.photos.build
    authorize @contest_photo
  end

  # GET /contest_photos/1/edit
  def edit
    authorize @contest_photo
  end

  # POST /contest_photos
  # POST /contest_photos.json
  def create
    @contest_photo = @contest.photos.build(contest_photo_params)
    authorize @contest_photo

    respond_to do |format|
      if @contest_photo.save
        format.html { redirect_to contest_photo_url(@contest, @contest_photo), notice: 'Contest photo was successfully created.' }
        format.json { render :show, status: :created, location: @contest_photo }
      else
        format.html { render :new }
        format.json { render json: @contest_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contest_photos/1
  # PATCH/PUT /contest_photos/1.json
  def update
    authorize @contest_photo
    respond_to do |format|
      if @contest_photo.update(contest_photo_params)
        format.html { redirect_to contest_photo_url(@contest, @contest_photo), notice: 'Contest photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @contest_photo }
      else
        format.html { render :edit }
        format.json { render json: @contest_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contest_photos/1
  # DELETE /contest_photos/1.json
  def destroy
    authorize @contest_photo
    @contest_photo.destroy
    respond_to do |format|
      format.html { redirect_to contest_photos_url(@contest), notice: 'Contest photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contest_photo
    @contest_photo = ContestPhoto.find(params[:id])
    @contest = @contest_photo.contest
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contest_photo_params
    params.require(:contest_photo).permit(:photo_id, :nomination_id)
  end
end
