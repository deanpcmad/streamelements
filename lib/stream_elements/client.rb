module StreamElements
  class Client

    class << self

      def connection
        @connection ||= Faraday.new("https://api.streamelements.com/kappa/v2") do |conn|
          conn.request :authorization, :Bearer, StreamElements.config.token

          conn.headers = {
            "User-Agent" => "streamelements/v#{VERSION} (github.com/deanpcmad/streamelements)"
          }

          conn.request :json

          conn.response :json, content_type: "application/json"
        end
      end


      def get_request(url, params: {}, headers: {})
        handle_response connection.get(replace_channel(url), params, headers)
      end

      def post_request(url, body: {}, headers: {})
        handle_response connection.post(replace_channel(url), body, headers)
      end

      def put_request(url, body: {}, headers: {})
        handle_response connection.put(replace_channel(url), body, headers)
      end

      def patch_request(url, body:, headers: {})
        handle_response connection.patch(replace_channel(url), body, headers)
      end

      def delete_request(url, headers: {})
        handle_response connection.delete(replace_channel(url), headers)
      end

      def replace_channel(url)
        url.gsub(":channel", StreamElements.config.channel)
      end

      def handle_response(response)
        case response.status
        when 400
          raise Error, "Error 400: Your request was malformed. '#{response.body["error"]}'"
        when 401
          raise Error, "Error 401: You did not supply valid authentication credentials. '#{response.body["error"]}'"
        when 403
          raise Error, "Error 403: You are not allowed to perform that action. '#{response.body["error"]}'"
        when 404
          raise Error, "Error 404: No results were found for your request. '#{response.body["error"]}'"
        when 409
          raise Error, "Error 409: Your request was a conflict. '#{response.body["error"]}'"
        when 429
          raise Error, "Error 429: Your request exceeded the API rate limit. '#{response.body["error"]}'"
        when 500
          raise Error, "Error 500: We were unable to perform the request due to server-side problems. '#{response.body["error"]}'"
        when 503
          raise Error, "Error 503: You have been rate limited for sending more than 20 requests per second. '#{response.body["error"]}'"
        when 501
          raise Error, "Error 501: This resource has not been implemented. '#{response.body["error"]}'"
        when 204
          return true
        end

        response
      end

    end

  end
end
