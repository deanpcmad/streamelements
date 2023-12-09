module StreamElements
  class SongRequestsResource < Resource

    def playing(channel:)
      SongRequest.new get_request("songrequest/#{channel}/playing").body
    end

    def queue(channel:)
      response = get_request("songrequest/#{channel}/queue")
      Collection.from_response(response, type: SongRequest)
    end

    def history(channel:, **params)
      response = get_request("songrequest/#{channel}/history", params: params)
      Collection.from_response(response, type: SongRequest, name: "history")
    end

    def add(channel:, video:)
      SongRequest.new post_request("songrequest/#{channel}/queue", body: { video: video }).body
    end

    def pause(channel:)
      response = post_request("songrequest/#{channel}/player/pause", body: {})
      response.success?
    end

    def play(channel:)
      response = post_request("songrequest/#{channel}/player/play", body: {})
      response.success?
    end

    def volume(channel:, volume:)
      response = post_request("songrequest/#{channel}/player/volume", body: {volume: volume})
      response.success?
    end

    def skip(channel:)
      response = post_request("songrequest/#{channel}/skip", body: {})
      response.success?
    end

  end
end
