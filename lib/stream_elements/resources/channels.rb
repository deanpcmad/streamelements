module StreamElements
  class ChannelsResource < Resource

    def me
      response = get_request("channels/me")
      Channel.new response.body
    end

  end
end
