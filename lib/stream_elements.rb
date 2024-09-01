# frozen_string_literal: true

require "faraday"
require "json"
require "stream_elements/version"

module StreamElements

  autoload :Error, "stream_elements/error"
  autoload :Errors, "stream_elements/error_generator"
  autoload :ErrorGenerator, "stream_elements/error_generator"
  autoload :ErrorFactory, "stream_elements/error_generator"

  autoload :Client, "stream_elements/client"
  autoload :Collection, "stream_elements/collection"
  autoload :Resource, "stream_elements/resource"
  autoload :Object, "stream_elements/object"

  autoload :ActivitiesResource, "stream_elements/resources/activitys"
  autoload :TipsResource, "stream_elements/resources/tips"
  autoload :SongRequestsResource, "stream_elements/resources/song_requests"
  autoload :UsersResource, "stream_elements/resources/users"
  autoload :ChannelsResource, "stream_elements/resources/channels"

  autoload :Activity, "stream_elements/objects/activity"
  autoload :Tip, "stream_elements/objects/tip"
  autoload :SongRequest, "stream_elements/objects/song_request"
  autoload :User, "stream_elements/objects/user"
  autoload :Channel, "stream_elements/objects/channel"
  autoload :TopTip, "stream_elements/objects/top_tip"

end
