require './communication_media'

describe CommunicationMedia do
  let(:p) { 23 }
  let(:a) { 5 }
  let(:b) { 7 }
  let(:communication_media) { CommunicationMedia.new(p, a, b) }
  let(:message_results) { communication_media.calculate_messages_for(message) }

  context :message_results do
    let(:message) { 7 }

    it 'should m4 should eq m' do
      expect(message_results[4]).to eq message
    end
  end

  context 'count_next_message_for & count_previous_message_for' do
    let(:message) { 17 }

    context 'we have just m2' do
      let(:m2) { message_results[2] }

      context 'count m3 for known m2' do
        it 'should eq message_results[3]' do
          expect(communication_media.count_next_message_for(m2, communication_media.alpha)).to eq message_results[3]
        end
      end

      context 'count m4 for known m2' do
        let(:m3) { communication_media.count_next_message_for(m2, communication_media.alpha) }

        it 'should eq message_results[3]' do
          expect(communication_media.count_next_message_for(m3, communication_media.beta)).to eq message_results[4]
        end
      end

      context 'count m1 for known m2' do
        it 'should eq message_results[1]' do
          expect(communication_media.count_previous_message_for(m2, b)).to eq message_results[1]
        end
      end

      context 'count m for known m2' do
        let(:m1) { communication_media.count_previous_message_for(m2, b) }

        it 'should eq message_results[2]' do
          expect(communication_media.count_previous_message_for(m1, a)).to eq message_results[0]
        end
      end
    end
  end
end