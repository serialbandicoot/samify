class AlbumsTracksController < ApplicationController
      def index
        @album_tracks = AlbumsTracks.search params[:artist_id], params[:album_id]

        respond_to do |format|
          format.json { render :json => @album_tracks }
        end

      end

end
