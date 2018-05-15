# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'spec_helper'

describe User do
  describe '#people' do
    let(:user) { User.create(email: 'tester@murphyweighin.com', password: 'eat2compete') }
    let(:person) { Person.create }
    it 'has people' do
      user.user_person_joins.create(person: person)
      expect(user.people).to match_array([person])
    end
  end
end
