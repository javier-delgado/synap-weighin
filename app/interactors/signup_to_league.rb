class SignupToLeague

  def self.call(person_id, league_id)
    person_league_join = PersonLeagueJoin.create(person_id: person_id, league_id: league_id)
    person_league_join
  end
end
