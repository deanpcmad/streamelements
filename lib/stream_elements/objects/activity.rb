module StreamElements
  class Activity < Object

    def initialize(attributes = {})
      attributes["id"] = attributes.delete("_id") if attributes["_id"]
      super
    end

  end
end
