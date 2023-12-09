module StreamElements
  class Collection
    attr_reader :data, :total

    def self.from_response(response, type:, name: nil)
      if name.nil?
        body = response.body
      else
        body = response.body[name]
      end

      new(
        data: body.map { |attrs| type.new(attrs) },
        total: body.count,
      )
    end

    def initialize(data:, total:)
      @data = data
      @total = total
    end
  end
end
