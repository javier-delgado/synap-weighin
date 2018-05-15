require 'spec_helper'

describe SignupToLeague do
  let(:event) { Event.create(name: '1') }
  let(:league) { League.create(name: '1', event: event) }
  let(:person) { Person.create }

  subject { described_class.call(league.id, person.id) }

  it 'signups a person to a league' do
    expect{subject}.to change{PersonLeagueJoin.count}.by(1)
  end
end
