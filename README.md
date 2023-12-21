# StreamElements

This is a Ruby library for the StreamElements API. **Currently in development**

## Installation

Add this line to your application's Gemfile:

```ruby
gem "streamelements"
```

## Usage

### Authentication

Firstly you'll need to set a JWT Token and Channel ID.

```ruby
StreamElements.configure do |config|
  config.token = ENV["STREAMELEMENTS_JWT_TOKEN"]
  config.channel = ENV["STREAMELEMENTS_CHANNEL_ID"]
end
```

### Activities

```ruby
# Retrieve a list of Activities
# https://dev.streamelements.com/docs/api-docs/861a5d5450bbb-channel
StreamElements::Activity.list

# Retrieve the Top Activities
# https://dev.streamelements.com/docs/api-docs/2ce44d058b16b-channel-top
StreamElements::Activity.top
```

### Tips

```ruby
# Retrieve a list of Tips
# https://dev.streamelements.com/docs/api-docs/704e5580be2d9-channel
StreamElements::Tip.list

# Retrieve a Tip
StreamElements::Tip.retrieve(id: "tip-id")

# Retrieve the Tip Tips
# https://dev.streamelements.com/docs/api-docs/b404f906817c4-channel-top
StreamElements::Tip.top
```

### Song Requests

```ruby
# Retrieve the current playing song
StreamElements::SongRequest.playing

# Retrieve a list of songs in the queue
StreamElements::SongRequest.queue

# Retrieve a list of previous songs
StreamElements::SongRequest.queue

# Add a song to the queue
# video is the YouTube video ID or URL
StreamElements::SongRequest.add(video: "video-id")

# Pause the player
StreamElements::SongRequest.pause

# Resume the player
StreamElements::SongRequest.play

# Set the volume of the player
# volume is a number between 0 and 100
StreamElements::SongRequest.volume(volume: 50)

# Skip the current song
StreamElements::SongRequest.skip

# Get the current song request settings
StreamElements::SongRequest.settings

# Set the current song request settings
# settings is a hash of settings
StreamElements::SongRequest.update_settings(settings: { max_requests: 5 })
```

### Users

```ruby
# Get the current user
StreamElements::User.current

# Get the users Channels
StreamElements::User.channels
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/deanpcmad/streamelements.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

