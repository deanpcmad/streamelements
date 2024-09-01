# StreamElements

This is a Ruby library for the StreamElements API. **Currently in development**

## Installation

Add this line to your application's Gemfile:

```ruby
gem "streamelements"
```

## Usage

### Set Client Details

Firstly you'll need to the access token, which can be an oAuth Token or JWT.

```ruby
@client = StreamElements::Client.new(access_token: "abc123")
```

### Resources

The gem maps as closely as we can to the StreamElements API so you can easily convert API examples to gem code.

Responses are created as objects like `StreamElements::Channel`. Having types like `StreamElements::User` is handy for understanding what
type of object you're working with. They're built using OpenStruct so you can easily access data in a Ruby-ish way.

### Channels

```ruby
# Get the current channel
@client.channels.me
```


### Users

```ruby
# Get the current user
@client.users.current

# Get the users Channels
@client.users.channels
```


### Activities

```ruby
# Retrieve a list of Activities
# https://dev.streamelements.com/docs/api-docs/861a5d5450bbb-channel
@client.activities.list(channel: "channel-id", after:, before:, limit:, types:)

# Retrieve the Top Activities
# https://dev.streamelements.com/docs/api-docs/2ce44d058b16b-channel-top
@client.activities.top(channel: "channel-id", period:, offset:, limit:, type:)
```

### Tips

```ruby
# Retrieve a list of Tips
# https://dev.streamelements.com/docs/api-docs/704e5580be2d9-channel
@client.tips.list(channel: "channel-id", after: "2024-01-01", sort: "createdAt", limit: 10)

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

# Get the current song request settings
@client.song_requests.settings(channel: "channel-id")

# Set the current song request settings
# settings is a hash of settings
@client.song_requests.update_settings(channel: "channel-id", settings: { max_requests: 5 })
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/deanpcmad/streamelements.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

