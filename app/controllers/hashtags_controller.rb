class HashtagsController < ApplicationController
  before_action :set_hashtag, only: [:update, :destroy]

  # GET /hashtags
  def index
    @hashtags = Hashtag.all

    render json: @hashtags
  end

  # POST /hashtags
  def create
    @hashtag = Hashtag.new(hashtag_params)

    if @hashtag.save
      render json: @hashtag, status: :created, location: @hashtag
    else
      render json: @hashtag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hashtags/1
  def destroy
    @hashtag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hashtag
      @hashtag = Hashtag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hashtag_params
      params.fetch(:hashtag, {}).permit(:name)
    end
end
