module StreamElements
  class UsersResource < Resource

    def current
      response = get_request("users/current")
      User.new response.body
    end

    def channels
      response = get_request("users/channels")
      Collection.from_response(response, type: Channel)
    end

  end
end
