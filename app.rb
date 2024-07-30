require 'sinatra'
require 'json'

# Habilita CORS para todas as rotas
before do
  content_type :json
  headers 'Access-Control-Allow-Origin' => '*',
          'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST', 'PUT', 'DELETE'],
          'Access-Control-Allow-Headers' => 'Content-Type'
end

options '*' do
  200
end

# set :app_file, _FILE_

# # Configuração do CORS
# set :allow_origin, "*"
# set :allow_methods, "GET,HEAD,POST,OPTIONS,PUT,PATCH,DELETE"
# set :allow_headers, "content-type,if-modified-since"
# set :expose_headers, "location,link"
# set :max_age, 3600
# set :allow_credentials, true

PRODUCTS = [{ name: "Capim Santo", price: 12, photo: "https://marciocereais.com.br/images_client/CAPIMSANTO.jpg", is_promotion: true },
{ name: "Anis Estrelado", price: 15.50, photo: "https://marciocereais.com.br/images_client/ANISESTRELADO.jpg", is_promotion: true },
{ name: "Canela de Velho", price: 13, photo: "https://marciocereais.com.br/images_client/CANELADEVELHO.jpg", is_promotion: false },
{ name: "Boldo do Chile", price: 13.75, photo: "https://marciocereais.com.br/images_client/BOLDODOCHILE.jpg", is_promotion: true },
{ name: "Camomila", price: 12, photo: "https://marciocereais.com.br/images_client/CAMOMILA.jpg", is_promotion: false }
]

SHOP_INFO = {
  name: "O Rei das Plantas",
  color: "#008B8B",
  owner: "Herberth Felipe",
  department: "Ervas Medicinais"
}

# Rota para obter todos os produtos
get '/products' do
  content_type :json
  PRODUCTS.to_json
end

# Rota para obter informações da loja
get '/info' do
  content_type :json
  SHOP_INFO.to_json
end

set port:7667