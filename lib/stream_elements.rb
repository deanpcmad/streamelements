# frozen_string_literal: true

require "faraday"
require "json"
require "stream_elements/version"

module StreamElements

  autoload :Client, "stream_elements/client"
  autoload :Collection, "stream_elements/collection"
  autoload :Error, "stream_elements/error"
  autoload :Resource, "stream_elements/resource"
  autoload :Object, "stream_elements/object"

  autoload :ActivitiesResource, "stream_elements/resources/activities"
  autoload :TipsResource, "stream_elements/resources/tips"

  autoload :Activity, "stream_elements/objects/activity"
  autoload :TopActivity, "stream_elements/objects/top_activity"
  autoload :Tip, "stream_elements/objects/tip"
  autoload :TopTip, "stream_elements/objects/top_tip"

end
