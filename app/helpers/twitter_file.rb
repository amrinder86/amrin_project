helpers do
  def start_client
    @client = Twitter::Streaming::Client.new do |config|
    config.consumer_key        =ENV['TWITTER_CONSUMER_KEY']
    config.consumer_secret     =ENV['TWITTER_CONSUMER_SECRET']
    config.access_token        =ENV['TWITTER_ACCESS_TOKEN']
    config.access_token_secret =ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
    @client
  end

  def twitter_call
    start_client
    @collection = []
    topics = ["AAPL"]
    @client.filter(track: topics.join(",")) do |object|
      @collection << object.to_h if object.is_a?(Twitter::Tweet)
      if @collection.length == 5
        return @collection
      end
    end

  end
  @collection
end
