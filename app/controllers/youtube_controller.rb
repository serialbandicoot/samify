class YoutubeController < ApplicationController
  def index
    @you_tube_ids = Youtube.search params[:artist_id], params[:album_id]

    respond_to do |format|
      format.json { render :json => @you_tube_ids }
    end
  end
end
