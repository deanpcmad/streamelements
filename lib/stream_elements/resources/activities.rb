module StreamElements
  class ActivitiesResource < Resource

    def list(channel:, after:, before:, limit:, types:, **params)
      attrs = { after: after, before: before, limit: limit, types: types }.merge(params)
      response = get_request("activities/#{channel}", params: attrs)
      Collection.from_response(response, type: Activity)
    end

    def top(channel:, period:, offset:, limit:, type:)
      attrs = { period: period, offset: offset, limit: limit, type: type }
      response = get_request("activities/#{channel}/top", params: attrs)
      Collection.from_response(response, type: TopActivity)
    end

  end
end
