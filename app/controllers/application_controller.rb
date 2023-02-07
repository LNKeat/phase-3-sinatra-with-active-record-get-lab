class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/' do
    { message: 'Welcome to our Bakery!'}.to_json
  end

  # add routes
  get '/bakeries' do
    bakeries = Bakery.all 
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json()
  end

  # get '/games/:id' do
  #   game = Game.find(params[:id])
  #   game.to_json(only: [:title, :price], include: {reviews: {only:[:score, :user_id]}})
  # end


  get '/baked-goods' do
    goods = BakedGood.all 
    goods.to_json
  end

  get '/baked_goods/by_price' do
    good = BakedGood.by_price
    good.to_json
  end

  get '/baked_goods/most_expensive' do
    good = BakedGood.by_price.first
    good.to_json
  end

end
