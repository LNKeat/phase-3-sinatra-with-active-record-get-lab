class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json';
  # add routes
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods' do
    baked_goods = BakedGood.all
    baked_goods.to_json
  end

  get '/baked_goods/by_price' do
    baked_goods_by_price = BakedGood.all.order(:price).reverse_order
    baked_goods_by_price.to_json
  end

  get '/baked_goods/most_expensive' do
    displayed_baked_good = BakedGood.all.order(:price).last
    displayed_baked_good.to_json
  end



end
