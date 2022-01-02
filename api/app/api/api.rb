class Api < Grape::API
  prefix 'api'
  mount Root
end