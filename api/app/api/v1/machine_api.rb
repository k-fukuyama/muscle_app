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

    get 'muscle/:muscle_id' do
      puts params
      muscle_id = params[:muscle_id]
      machines = Machine.joins(:muscle_machines).where(muscle_machines: { muscle_id: muscle_id }).select(:id, :name)
      present ({machines: Services::MachineService.new.build_response(machines, muscle_id)})
    end
  end
end