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

FactoryBot.define do
  factory :league do
    name { "#{Faker::Food.dish} League" }
    event nil
  end
end
