require 'lastfm'

class AlbumsTracks

  attr :track_information

  def initialize(track_information)
    @track_information = track_information
  end

  # This will return an array of Artist instances
  def self.search(artist, album)
    parse lastfm.album.get_info(:artist => artist, :album => album)
  end

  # Takes lastfm results and returns Artist objects
  def self.parse(lastfm_results)
    tracks_duration = {}
    lastfm_results["tracks"]["track"].collect { |ds| tracks_duration[ds["name"]] = ds["duration"] }
    tracks_duration
  end

  def self.lastfm
    @@lastfm ||= begin
      config = Rails.configuration.lastfm
      Lastfm.new config.api_key, config.secret
    end
  end

end
