class AlbumsController < ApplicationController

  def index
    @artist = Artist.new params[:artist_id]
    @albums = @artist.albums.map{|n| n.name }
    @albums = @albums.find_all{|n| n.downcase =~ matcher }

    respond_to do |format|
      format.json { render :json => @albums }
    end
  end

private

  def matcher
    params[:term] ? Regexp.new(Regexp.escape(params[:term].downcase)) : /.*/
  end

end