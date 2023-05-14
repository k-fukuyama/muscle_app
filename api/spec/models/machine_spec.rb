require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe '#video_urls_by_muscle_id' do
    subject { machine.video_urls_by_muscle_id(muscle.id) }

    let(:machine) { create(:machine) }
    let(:muscle) { create(:muscle) }

    before { create(:training_way_video, machine: machine, muscle_id: muscle.id, url: 'test_url') }

    it 'muscle_idに該当する動画のurlを取得すること' do
      expect(subject).to eq ['test_url']
    end
  end
end