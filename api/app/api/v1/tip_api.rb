class TipApi < Grape::API
  resources :tips do
    get do
      present ({tips: Tip.all})
    end

    post do
      Tip.create!(title: params[:tip][:title], content: params[:tip][:content])

      present ({isCreated: true})
    end

    patch do
      tip = Tip.find_by(id: params[:tip][:id])
      isUpdated = if tip.nil?
                    status 404
                    false
                  else
                    tip.update(title: params[:tip][:title], content: params[:tip][:content])
                  end

      present ({isUpdated: isUpdated})
    end

    delete do
      tip = Tip.find_by(id: params[:tip][:id])
      isDeleted = if tip.nil?
                    status 404
                    false
                  else
                    tip.destroy
                  end

      present ({isDeleted: isDeleted})
    end
  end
end