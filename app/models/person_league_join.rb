# == Schema Information
#
# Table name: person_league_joins
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  league_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class PersonLeagueJoin < ActiveRecord::Base
  belongs_to :person
  belongs_to :league
end
