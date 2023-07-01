require 'rails_helper'

RSpec.describe Services::FoodService, type: :model do
  describe '#build_response' do
    subject { described_class.new.build_response(params) }

    context 'パラメータのmenu_idに値がある時' do
      let(:params) { { menu_id: menu.id} }
      let(:menu) { create(:menu) }
      let(:not_target_food) { create(:food, name: 'food1', calorie: 270, protein: 15.0, fat: 10.0, carbohydrate: 30.0) }
      let!(:target_food) { create(:food, name: 'food2', calorie: 135, protein: 10.0, fat: 5.0, carbohydrate: 15.0) }

      before do
        create(:food_menu, menu: menu, food: not_target_food)
      end

      it 'menuに関連を持たないfoodを取得すること' do
        expect(subject.first.id).to eq target_food.id
      end
    end

    context 'パラメータのmenu_idに値がない時' do
      let(:params) { { menu_id: nil, protein_condition: '2', protein_num: 15, fat_condition: '2', fat: 5, carbohydrate_condition: '2', carbohydrate: 15} }
      let(:menu) { create(:menu) }
      let!(:target_food) { create(:food, name: 'food1', calorie: 270, protein: 15.0, fat: 10.0, carbohydrate: 30.0) }
      let!(:not_target_food) { create(:food, name: 'food2', calorie: 135, protein: 10.0, fat: 5.0, carbohydrate: 15.0) }

      it '条件に該当するfoodを全て返すこと(target_foodを取得すること)' do
        expect(subject.first.id).to eq target_food.id
      end
    end
  end
end