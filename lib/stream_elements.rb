# frozen_string_literal: true

require "faraday"
require "json"
require "stream_elements/version"

module StreamElements

  autoload :Configuration, "stream_elements/configuration"
  autoload :Client, "stream_elements/client"
  autoload :Collection, "stream_elements/collection"
  autoload :Error, "stream_elements/error"
  autoload :Object, "stream_elements/object"

  class << self
    attr_writer :config
  end

  def self.configure
    yield(config) if block_given?
  end

  def self.config
    @config ||= StreamElements::Configuration.new
  end

  autoload :Activity, "stream_elements/models/activity"
  autoload :Tip, "stream_elements/models/tip"
  autoload :SongRequest, "stream_elements/models/song_request"
  autoload :User, "stream_elements/models/user"
  autoload :Channel, "stream_elements/models/channel"

end
