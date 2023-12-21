module StreamElements
  class User < Object

    class << self

      def current
        response = Client.get_request("users/current")
        User.new response.body
      end

      def channels
        response = Client.get_request("users/channels")
        Collection.from_response(response, type: Channel)
      end

    end

  end
end
