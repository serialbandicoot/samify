class Album

  attr :artist
  attr :name

  def initialize(artist, name)
    @artist = artist
    @name   = name
  end

  # This will return an array of Artist instances
  def self.search(artist)
    parse lastfm.artist.get_top_albums(:artist => artist.name), artist
  end

  # Takes lastfm results and returns Artist objects
  def self.parse(lastfm_results, artist)
    lastfm_results.map{|a| Album.new artist, a["name"] }
  end

  def self.lastfm
    @@lastfm ||= begin
      config = Rails.configuration.lastfm
      Lastfm.new config.api_key, config.secret
    end
  end

end