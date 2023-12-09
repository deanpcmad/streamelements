# StreamElements

This is a Ruby library for the StreamElements API. **Currently in development**

## Installation

Add this line to your application's Gemfile:

```ruby
gem "streamelements"
```

## Usage

### Authentication

Firstly you'll need to set either a JWT Token or an OAuth Access Token.

```ruby
# Set a JWT Token
@client = StreamElements::Client.new(jwt_access_token: "")

# Or set an OAuth Access Token
@client = StreamElements::Client.new(access_token: "")
```

Most of the API requires the Channel ID to be passed as an argument.

### Activities

```ruby
# Retrieve a list of Activities
# https://dev.streamelements.com/docs/api-docs/861a5d5450bbb-channel
@client.activities.list(channel: "channel-id")

# Retrieve the Top Activities
# https://dev.streamelements.com/docs/api-docs/2ce44d058b16b-channel-top
@client.actvitities.top(channel: "channel-id")
```

### Tips

```ruby
# Retrieve a list of Tips
# https://dev.streamelements.com/docs/api-docs/704e5580be2d9-channel
@client.tips.list(channel: "channel-id")

# Retrieve a Tip
@client.tips.retrieve(channel: "channel-id", id: "tip-id")

# Retrieve the Tip Tips
# https://dev.streamelements.com/docs/api-docs/b404f906817c4-channel-top
@client.tips.top(channel: "channel-id")
```

### Song Requests

```ruby
# Retrieve the current playing song
@client.song_requests.playing(channel: "channel-id")

# Retrieve a list of songs in the queue
@client.song_requests.queue(channel: "channel-id")

# Retrieve a list of previous songs
@client.song_requests.queue(channel: "channel-id")

# Add a song to the queue
# video is the YouTube video ID or URL
@client.song_requests.add(channel: "channel-id", video: "video-id")

# Pause the player
@client.song_requests.pause(channel: "channel-id")

# Resume the player
@client.song_requests.play(channel: "channel-id")

# Set the volume of the player
# volume is a number between 0 and 100
@client.song_requests.volume(channel: "channel-id", volume: 50)

# Skip the current song
@client.song_requests.skip(channel: "channel-id")
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/deanpcmad/streamelements.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

