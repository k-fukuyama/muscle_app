class MachineApi < Grape::API
  resources :machine do
    post do
      Machine.create!(name: params[:machine][:name], description: params[:machine][:description])

      present ({isCreated: true})
    end
  end
end