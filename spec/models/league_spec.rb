require 'spec_helper'

describe League do
  let(:event) { Event.create(name: '1')}
  let(:league) { League.create(name: '1', event: event)}

  it 'creates a new league' do
    expect{league}.to change{League.count}.by(1)
  end

  it 'sets the name ' do
    expect(league.name).to eql('1')
  end
end
