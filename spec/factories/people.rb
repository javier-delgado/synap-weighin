# == Schema Information
#
# Table name: people
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  starting_weight :decimal(, )
#  up_by           :decimal(, )
#

FactoryBot.define do
  factory :person do
    name { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
  end
end
