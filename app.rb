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

set :app_file, _FILE_

# # Configuração do CORS
# set :allow_origin, "*"
# set :allow_methods, "GET,HEAD,POST,OPTIONS,PUT,PATCH,DELETE"
# set :allow_headers, "content-type,if-modified-since"
# set :expose_headers, "location,link"
# set :max_age, 3600
# set :allow_credentials, true

# Dados estáticos para exemplo
PRODUCTS = [
  { name: "Champagne Dom Perignon Brut", price: 34820, photo: "https://http2.mlstatic.com/D_NQ_NP_2X_973962-MLB74227295085_012024-F.webp", is_promotion: true },
  { name: "Queijo Winnimere", price: 280, photo: "https://i0.wp.com/top10mais.org/wp-content/uploads/2016/08/Winnimere-entre-os-queijos-mais-caros-do-mundo.jpg", is_promotion: true },
  { name: "Salame Italiano Toscano Finocchiona", price: 195, photo: "https://charcutaria.org/wp-content/uploads/2017/06/P1010261.jpg", is_promotion: true },
  { name: "Azeitonas Pretas Colossais Grega Olymp", price: 43, photo: "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQkOTB7Y0rOwcTkMW_F7hQtegko8wOfiJ1Ia9ttuR9irSmPpP1kh-ETEXHhP89keUtO8W3UKES2T-sTUfeJK6evz8QJQBGUutO21SeB2QLplgUzsc1lhHs2MA&usqp=CAE", is_promotion: false },
  { name: "Pão Italiano Recheado", price: 65, photo: "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSCgPKJMmMlKPWyTYZVqjGQ6H28UlYkQIaXnN7Iz1oPH98LPaG1yX9z98OaOdWzKVXPjex7VJhHIORHZyJS_WIPy5A8Gx7-C0GjSIvzjKxf&usqp=CAE", is_promotion: false }
]

SHOP_INFO = {
  name: "Minha Loja",
  color: "#0000FF",
  owner: "João",
  department: "Vendas"
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

run! if _FILE_ == $0