module StreamElements
  class Client
    BASE_URL = "https://api.streamelements.com/kappa/v2"

    attr_reader :jwt_access_token, :access_token, :adapter

    def initialize(jwt_access_token: nil, access_token: nil, adapter: Faraday.default_adapter)
      @jwt_access_token = jwt_access_token
      @access_token = access_token
      @adapter = adapter
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
        if jwt_access_token
          conn.request :authorization, :Bearer, jwt_access_token
        elsif access_token
          conn.request :authorization, :Bearer, access_token
        else
          raise Error, "You must provide a jwt or access token."
        end

        conn.headers = {
          "User-Agent" => "streamelements/v#{VERSION} (github.com/deanpcmad/streamelements)"
        }

        conn.request :json

        conn.response :json, content_type: "application/json"

        conn.adapter adapter, @stubs
      end
    end

  end
end
