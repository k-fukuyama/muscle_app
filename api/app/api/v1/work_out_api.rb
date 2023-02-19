class WorkOutApi < Grape::API
  resources :work_outs do
    get do
      present ({work_outs: WorkOut.all})
    end

    post do
      WorkOut.create!(name: params[:name], part: params[:part])

      present ({isCreated: true})
    end

    get '/:muscle_id' do
      present ({work_outs: WorkOut.where(muscle_id: params[:muscle_id])})
    end
  end
end