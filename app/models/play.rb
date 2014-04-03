class Play

  attr_accessor :artist, :album, :album_tracks, :yt_video_id, :msg, :url

  def initialize
     @album_tracks, @yt_video_id = [], []
  end

  def create_playlist
    #Create a Playlist if not found then show list of artists albums
    begin
      self.album_tracks = AlbumsTracks.search(artist, album).to_a
      you_tube_tracks
      self.url = Youtube.get_yt_url(self.yt_video_id)
    rescue
      list_artists_albums
    end
  end

  def list_artists_albums
    begin
        artist_name = Artist.new artist
        album_list = artist_name.albums.map{|n| n.name }
        self.msg = "No Album found try: #{album_list.join(' ')}"
    rescue
      self.msg = "No Tacks or Artist found"
    end
  end

  def you_tube_tracks
    self.yt_video_id = Youtube.search artist, album
  end

end