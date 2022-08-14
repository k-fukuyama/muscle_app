module Services
  class FoodService
    def build_response(params)
      return Food.all unless params.present?

      query = build_query(params)
      if params[:menu_id].present?
        registered_food_ids = Menu.find(params[:menu_id]).foods.pluck(:id)
        Food.
        where.not(id: registered_food_ids).
        where(query[:protein_condtion]).
        where(query[:fat_condition]).
        where(query[:carbohydrate_condition]).
        where(query[:calorie_condition])
      else
        Food.
        where(query[:protein_condtion]).
        where(query[:fat_condition]).
        where(query[:carbohydrate_condition]).
        where(query[:calorie_condition])
      end
    end

    def build_query(params)
      query = {}

      if params['protein_condition'].present? && params['protein_num'].present?
        query[:protein_condtion] = set_search_condtion(
          'protein', 
          set_more_than_or_less_than(params['protein_condition']), 
          params['protein_num']
        )
      end

      if params['fat_condition'].present? && params['fat_num'].present?
        query[:fat_condition] = set_search_condtion(
          'fat', 
          set_more_than_or_less_than(params['fat_condition']), 
          params['fat_num']
        )
      end

      if params['carbohydrate_condition'].present? && params['carbohydrate_num'].present?
        query[:carbohydrate_condition] = set_search_condtion(
          'carbohydrate', 
          set_more_than_or_less_than(params['carbohydrate_condition']), 
          params['carbohydrate_num']
        )
      end

      if params['calorie_condition'].present? && params['calorie_num'].present?
        query[:calorie_condition] = set_search_condtion(
          'calorie', 
          set_more_than_or_less_than(params['calorie_condition']), 
          params['calorie_num']
        )
      end

      query
    end

    def set_search_condtion(column_name, more_than_or_less_than, num)
      ["#{column_name} #{more_than_or_less_than} ?", num]
    end

    def set_more_than_or_less_than(value)
      value == '2' ? '>=' : '<='
    end
  end
end