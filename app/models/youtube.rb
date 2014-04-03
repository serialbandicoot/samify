class Youtube

  def self.get_yt_url(yt_video_id)
    puts yt_video_id
    if yt_video_id.count > 0 then
      "http://www.youtube.com/embed/#{yt_video_id.first}?html5=1&autoplay=0&rel=0&amp;playlist=#{yt_video_id[1..(yt_video_id.count)].join(',')}"
    end
  end


  def self.search(artist, album)
     yt_video_id = []
     album_tracks = AlbumsTracks.search artist, album
     album_tracks.to_a.each_with_index do |track|
      yt = YoutubeSearch.search("#{artist} #{album} #{track[0]}")
      yt.each do |yt_info|
        track_bandwidth_low = yt_info["duration"].to_i - 5
        track_bandwidth_high = yt_info["duration"].to_i + 5

        if track[1].to_i > track_bandwidth_low and track[1].to_i < track_bandwidth_high then
          yt_video_id << yt_info["video_id"]
          break
        end
        #p "Track name #{track[0]} duration #{track[1]} yt_duration #{yt_info["duration"]} yt_title #{yt_info["title"]}"
      end

    end
    yt_video_id
  end


end