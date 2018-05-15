require 'spec_helper'

describe CreateLeague do
  let(:event) { Event.create(name: '1') }
  let!(:league) { League.create(name: '1', event: event) }

  subject { described_class.call('2', event) }

  it 'creates a new league' do
    expect{subject}.to change{League.count}.by(1)
  end

  it 'sets the name and event' do
    expect(subject.name).to eql('2')
    expect(subject.event).to eql(event)
  end
end
