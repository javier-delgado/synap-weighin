class CreateLeague

  def self.call(name, event)
    league = League.create(name: name, event: event)
    league
  end
end
