module StreamElements
  class Tip < Object

    class << self

      def list(**params)
        response = Client.get_request("tips/:channel", params: params)
        Collection.from_response(response, type: Tip, name: "docs")
      end

      def retrieve(id:)
        Tip.new Client.get_request("tips/:channel/#{id}").body
      end

      def top
        response = Client.get_request("tips/:channel/top")
        # Collection.from_response(response, type: TopTip)
      end

    end

  end
end
