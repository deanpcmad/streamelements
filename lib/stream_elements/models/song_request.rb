module StreamElements
  class SongRequest < Object

    class << self

      def playing
        SongRequest.new Client.get_request("songrequest/:channel/playing").body
      end

      def queue
        response = Client.get_request("songrequest/:channel/queue")
        Collection.from_response(response, type: SongRequest)
      end

      def history(**params)
        response = Client.get_request("songrequest/:channel/history", params: params)
        Collection.from_response(response, type: SongRequest, name: "history")
      end

      def settings
        Client.get_request("songrequest/:channel/settings").body
      end

      def update_settings(settings:)
        response = Client.put_request("songrequest/:channel/settings", body: settings)
        response.success?
      end

      def add(video:)
        SongRequest.new Client.post_request("songrequest/:channel/queue", body: { video: video }).body
      end

      def pause
        response = Client.post_request("songrequest/:channel/player/pause", body: {})
        response.success?
      end

      def play
        response = Client.post_request("songrequest/:channel/player/play", body: {})
        response.success?
      end

      def volume(volume:)
        response = Client.post_request("songrequest/:channel/player/volume", body: {volume: volume})
        response.success?
      end

      def skip
        response = Client.post_request("songrequest/:channel/skip", body: {})
        response.success?
      end

    end

  end
end
