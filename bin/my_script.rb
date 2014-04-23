require 'addressable/uri'
require 'rest-client'

# query_hash = {
#     'foods[fruits][green]' => 'apple',
#     'foods[fruits][orange]' => 'orange',
#     'foods[meat][poultry]' => 'chicken',
#     'foods[meat][beef]' => 'cow'
#   }

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/2/contacts',
  query_values: nil
).to_s

# puts RestClient.post(
#     url,
#     { :user => { :name => "Gizmo", :email => "gizmo@gizmo.gizmo", :age => 100} }
#   )
#
puts RestClient.get(url)