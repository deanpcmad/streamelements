module StreamElements
  class TipsResource < Resource

    def list(channel:, **params)
      response = get_request("tips/#{channel}", params: params)
      Collection.from_response(response, type: Tip, name: "docs")
    end

    def retrieve(channel:, id:)
      Tip.new get_request("tips/#{channel}/#{id}").body
    end

    def top(channel:)
      response = get_request("tips/#{channel}/top")
      Collection.from_response(response, type: TopTip)
    end

  end
end
