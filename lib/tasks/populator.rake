require 'csv'

namespace :db do
  desc "Populates database from csv file"
  task populate: :environment do
    ActiveRecord::Base.transaction do
      csv_contents = CSV.read(Rails.root.join("participants.csv"))
      csv_contents.shift
      csv_contents.each do |row|
        person = Person.find_or_create_by(name: row[0])
        event = Event.find_or_create_by(name: row[1], created_at: row[3])
        league = League.find_or_create_by(name: row[2], event: event, created_at: row[3])
        PersonLeagueJoin.find_or_create_by(person: person, league: league)
      end
      
      
      csv_contents = CSV.read(Rails.root.join("weighins.csv"))
      csv_contents.shift
      csv_contents.each do |row|
        person = Person.find_or_create_by(name: row[0])
        event = Event.find_or_create_by(name: row[2])
        CreateCheckin.call(person, event, row[1].to_i, nil)
      end
    end
  end
end
