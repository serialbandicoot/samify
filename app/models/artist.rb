class Artist

  attr :name

  def initialize(name)
    @name = name
  end

  def albums
    Album.search self
  end

  def to_json(*args)
    albums.map{|a| a.name }.to_json *args
  end

  # This will return an array of Artist instances
  def self.search(name)
    if name
      parse lastfm.artist.search( name )
    else
      []
    end
  end

  # Takes lastfm results and returns Artist objects
  def self.parse(lastfm_results)
    if lastfm_results["status"] == "ok"
      lastfm_results["results"]["artistmatches"]["artist"].map{|e| Artist.new e["name"] }
    else
      []
    end
  end

  def self.lastfm
    @@lastfm ||= begin
      config = Rails.configuration.lastfm
      Lastfm.new config.api_key, config.secret
    end
  end

end