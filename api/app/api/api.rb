class Api < Grape::API
  GrapeDeviseTokenAuth.setup! do |config|
    config.authenticate_all = false
  end
  # app/api/resources/v1/root.rbをマウント
  mount Root
end