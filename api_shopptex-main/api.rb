require 'sinatra'
require 'json'
set :bind, '0.0.0.0'
set :port, 4567

# Habilitando CORS
before do
    content_type :json
    headers 'Access-Control-Allow-Origin' => '*',
            'Access-Control-Allow-Methods' => ['GET'],
            'Access-Control-Allow-Headers' => 'Content-Type'
end
  
options '*' do
    200
end

products = [
    {
        photo: "https://m.media-amazon.com/images/I/61xOtH1kTsL._AC_UL320_.jpg",
        name: "One Piece 3 em 1 Vol. 1",
        price: 42.40,
        is_promotion: true
    },
    
    {
        photo: "https://m.media-amazon.com/images/I/61qIf0h9O3L._AC_UL320_.jpg",
        name: "Haikyu!! Vol. 07 - Big",
        price: 32.99,
        is_promotion: false
    },

    {
        photo: "https://m.media-amazon.com/images/I/71QS2yNxhoL._AC_UL320_.jpg",
        name: "Chainsaw Man Vol. 1",
        price: 27.70,
        is_promotion: true
    }
]

shop_info = {
    name: "Manga's house",
    color: "#1d288f",
    owner: "Alansidney Júnior",
    department: "Books"
}

get "/products" do
    content_type :json
    products.to_json
end

get "/info" do
    content_type :json
    shop_info.to_json
end

