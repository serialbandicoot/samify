class PlayController < ApplicationController
  def index

    if params[:artist]
      @samify = Play.new
      @samify.artist = params[:artist]
      @samify.album = params[:album]
      @samify.create_playlist
    end

    respond_to do |format|
        format.js  {render :content_type => 'text/javascripts'}
        format.html
    end
  end
end
