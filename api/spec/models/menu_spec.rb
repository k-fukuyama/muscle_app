require 'rails_helper'

RSpec.describe Menu, type: :model do
  describe '#save_and_calculate_alimentation' do
    subject { menu.save_and_calculate_alimentation! }

    let(:menu) { create(:menu) }
    let(:food1) { create(:food, name: 'food1', calorie: 270, protein: 15.0, fat: 10.0, carbohydrate: 30.0) }
    let(:food2) { create(:food, name: 'food2', calorie: 135, protein: 10.0, fat: 5.0, carbohydrate: 15.0) }

    before do
      create(:food_menu, menu: menu, food: food1)
      create(:food_menu, menu: menu, food: food2)
    end

    it 'menuの栄養素の情報が、紐付いている食べ物の栄養素を合算したものに更新されること' do
      expect { subject }.to change { menu.calorie }.from(0.0).to(405.0).
      and change { menu.protein }.from(0.0).to(25.0).
      and change { menu.fat }.from(0.0).to(15.0).
      and change { menu.carbohydrate }.from(0.0).to(45.0)
    end
  end
end