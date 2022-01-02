class MachineApi < Grape::API
  resources :machine do
    get do
      present ({machines: Machine.all.select(:id, :name, :description)})
    end

    post do
      Machine.create!(name: params[:machine][:name], description: params[:machine][:description])

      present ({isCreated: true})
    end

    patch '' do
      machine = Machine.find_by(id: params[:machine][:id])
      isUpdated = if machine.nil?
                    status 404
                    false
                  else
                    machine.update(name: params[:machine][:name], description: params[:machine][:description])
                  end

      present ({isUpdated: isUpdated})
    end

    delete do
      machine = Machine.find_by(id: params[:machine][:id])
      isDeleted = if machine.nil?
                    status 404
                    false
                  else
                    machine.destroy
                  end

      present ({isDeleted: isDeleted})
    end
  end
end