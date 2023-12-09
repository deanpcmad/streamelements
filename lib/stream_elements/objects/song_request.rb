module StreamElements
  class SongRequest < Object

    def initialize(attributes = {})
      attributes["id"] = attributes.delete("_id") if attributes["_id"]
      super
    end

  end
end
