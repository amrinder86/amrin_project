helpers do
  def start_client
    @client = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = "iErTVipNujowMDzj4WGfEyfdV"
    config.consumer_secret     = "1TOlGl069Xv2agsWscmDvdHCJ2qkcPQ9xcA04sUqKHS52b3dD3"
    config.access_token        = "765301571659890693-ZHUVJKEvFxSZhT6LEBtkBD6usJMpRIv"
    config.access_token_secret = "ggQ7tUrOXJfNx3uhy050GlO4hzkZWMoDpwOrlruU5QIbd"
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
