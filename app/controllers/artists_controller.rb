class ArtistsController < ApplicationController

  # Tells me about a list of artists, ie a search
  def index
    @results = Artist.search params[:term]

    respond_to do |format|
      format.json { render :json => @results.map{|a| a.name } }
      format.html
    end
  end

end