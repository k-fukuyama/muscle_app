require 'rails_helper'

RSpec.describe Services::MenuService, type: :model do
  describe '#create_menu!' do
    subject { described_class.new.create_menu!(foods, 'メニュー名', 'メニューメモ') }

    let!(:foods) do
      [
        create(:food, name: 'food1', calorie: 270, protein: 15.0, fat: 10.0, carbohydrate: 30.0),
        create(:food, name: 'food2', calorie: 135, protein: 10.0, fat: 5.0, carbohydrate: 15.0)
      ]
    end

    it 'menuが作成されfoodとmenuが関連付くこと' do
      expect { subject }.to change(Menu, :count).from(0).to(1).
      and change(FoodMenu, :count).from(0).to(2)
      
      expect(FoodMenu.pluck(:food_id)).to match_array(foods.pluck(:id))
    end
  end

  describe '#update_menu!' do
    subject { described_class.new.update_menu!(params) }

    let(:menu) { create(:menu) }
    let(:food) { create(:food, name: 'food1', calorie: 270, protein: 15.0, fat: 10.0, carbohydrate: 30.0) }
    let(:params) do
      {
        menu: { menu_id: menu.id},
        foods: [{ registered: false, id: food.id }]
      }
    end

    it 'menuの栄養素が更新されfoodとmenuが関連付くこと' do
      expect { subject }.to change{ menu.reload.foods.count }.to(1).
      and change { menu.calorie }.to(270.0).
      and change { menu.protein }.to(15.0).
      and change { menu.fat }.to(10.0).
      and change { menu.carbohydrate }.to(30.0)

      food_menu = FoodMenu.first
      expect(food_menu.menu_id).to eq menu.id
      expect(food_menu.food_id).to eq food.id
    end
  end
end