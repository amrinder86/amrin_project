post '/tweet' do
  @serached_word = params[:hashtag]
  @word = twitter_call(params[:hashtag])
  erb :'tweets/new'
end

