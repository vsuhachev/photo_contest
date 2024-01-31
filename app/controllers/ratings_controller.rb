class RatingsController < AdminController
  include JsonController

  before_action :set_rating, only: [:show, :update, :destroy]

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  # GET /ratings.json
  def index
    authorize Rating
    @ratings = policy_scope(Rating).all
  end

  # GET /ratings/1.json
  def show
    authorize @rating
  end

  # POST /ratings.json
  def create
    @rating = Rating.new(create_rating_params)
    @rating.juror = juror_for(@rating)
    authorize @rating

    if @rating.save
      render :show, status: :created, location: @rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ratings/1.json
  def update
    authorize @rating
    if @rating.update(update_rating_params)
      render :show, status: :ok, location: @rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ratings/1.json
  def destroy
    authorize @rating
    if @rating.destroy
      head :no_content
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  private

  def set_rating
    @rating = Rating.find(params[:id])
  end

  def juror_for(rating)
    if (contest = rating&.contest)
      contest.juror_for_user(current_user)
    end
  end

  def create_rating_params
    params.require(:rating).permit(:photo_id, :criterion_id, :value)
  end

  def update_rating_params
    params.require(:rating).permit(:value)
  end

  def not_authorized(err)
    logger.debug { err.inspect }
    render json: {base: ["Not Authorized"]}, status: :forbidden
  end
end
