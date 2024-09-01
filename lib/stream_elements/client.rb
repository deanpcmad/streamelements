module StreamElements
  class Client

    BASE_URL = "https://api.streamelements.com/kappa/v2"

    attr_reader :access_token

    def initialize(access_token:)
      @access_token = access_token
    end

    def channels
      ChannelsResource.new(self)
    end

    def users
      UsersResource.new(self)
    end

    def activities
      ActivitiesResource.new(self)
    end

    def tips
      TipsResource.new(self)
    end

    def song_requests
      SongRequestsResource.new(self)
    end


    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.request :authorization, :Bearer, access_token

        conn.headers = {
            "User-Agent" => "streamelements/v#{VERSION} (github.com/deanpcmad/streamelements)"
          }

        conn.request :json

        conn.response :json, content_type: "application/json"
      end
    end

  end
end
