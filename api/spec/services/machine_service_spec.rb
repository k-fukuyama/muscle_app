require 'rails_helper'

RSpec.describe Services::MachineService, type: :model do
  describe '#build_response' do
    subject { described_class.new.build_response(machines, muscle.id) }

    let(:machines) { [ create(:machine, name: 'ダンベル') ] }
    let(:muscle) { create(:muscle) }
    let!(:training_way_video) { create(:training_way_video, machine_id: machines.first.id, muscle_id: muscle.id, url: 'url1') }
    let!(:training_way_video2) { create(:training_way_video,machine_id: machines.first.id,  muscle_id: muscle.id, url: 'url2') }

    it 'machineの情報とraining_way_videoを返すこと' do
      expect(subject).to eq [{ id: machines.first.id, name: machines.first.name, video_urls: ['url1', 'url2'] }]
    end
  end
end