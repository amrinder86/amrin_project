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

  def twitter_call(word)
  # def twitter_call
    # word = @word
    start_client
    @collection = []
    topics = ['#{word}']
    # topics = ["Google"]
    # topics = [word]

    @client.filter(track: topics.join(",")) do |object|
      @collection << object.to_h if object.is_a?(Twitter::Tweet)
      if @collection.length == 5
        return @collection
      end
    end

  end
  @collection
end
def test_method
  # def twitter_call
    # word = @word
    start_client
    @collection1 = []
    # topics = ['#{word}']
    topics = ["movie"]
    # topics = [word]

    @client.filter(track: topics.join(",")) do |object|
      @collection1 << object.to_h if object.is_a?(Twitter::Tweet)
      if @collection1.length == 5
        return @collection1
      end
    end

  end
  @collection1
end
