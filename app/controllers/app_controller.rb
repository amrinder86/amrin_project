post '/tweet' do

  @word = twitter_call(params[:hashtag])
  erb :'tweets/new'
end

