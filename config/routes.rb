Rails.application.routes.draw do
  post '/urls' => 'simple_links#add_url'
  get '/urls/:short_url' => 'simple_links#get_url'
  get '/urls/:short_url/stats' => 'simple_links#get_url_stats'
end
