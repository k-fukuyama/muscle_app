class MachineApi < Grape::API
  resources :machine do
    get do
      present ({machines: Machine.all.select(:id, :name, :description)})
    end

    post do
      Machine.create!(name: params[:machine][:name], description: params[:machine][:description])

      present ({isCreated: true})
    end
  end
end