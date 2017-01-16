class PhotosController < ApplicationController
  include ContestControllerPart

  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  add_breadcrumb I18n.t('photos.index.title'), ->(c) { c.contest_photos_path(c.instance_variable_get(:@contest)) }

  # GET /photos
  # GET /photos.json
  def index
    authorize Photo
    @photos = policy_scope(@contest.photos).all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    add_breadcrumb @photo
    authorize @photo
  end

  # GET /photos/new
  def new
    add_breadcrumb I18n.t('app.crumbs.new')
    @photo = @contest.photos.build
    authorize @photo
  end

  # GET /photos/1/edit
  def edit
    authorize @photo
    add_breadcrumb @photo
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = @contest.photos.build(photo_params.merge(user: current_user))
    authorize @photo

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    authorize @photo
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    authorize @photo
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to contest_photos_url(@contest), notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
    @contest = @photo.contest
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :location, :obtained_at, :image, :competitor_id, :nomination_id)
  end
end
