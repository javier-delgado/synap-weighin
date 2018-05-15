# == Schema Information
#
# Table name: leagues
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  event_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class League < ActiveRecord::Base
  default_scope { order(created_at: :asc) }
  
  belongs_to :event
  has_many :person_league_joins
  has_many :people, through: :person_league_joins
end
