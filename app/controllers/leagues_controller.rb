class LeaguesController < ApplicationController
  before_action :set_event
  
  def index
    @leagues = League.where(event: @event).order(:id)
  end

  def show
    @league = League.find(params[:id])
  end

  def create
    @league = League.new(league_params)
    @league.event = @event
    @league.save
    redirect_to league_path(@league)
  end
  
  def signup_form
    @league = League.find(params[:league_id])
    @people = Person.all
      .includes(:person_league_joins)
      .references(:person_league_joins)
      .where("
        ? NOT IN (
          SELECT DISTINCT(league_id) 
          FROM person_league_joins 
          WHERE person_league_joins.person_id = people.id
        )
      ", params[:league_id])
      .order(:name)
  end
  
  def signup
    person_league_join = PersonLeagueJoin.new(person_league_join_params)
    person_league_join.league_id = params[:league_id]
    person_league_join.save
    redirect_to league_path(params[:league_id])
  end

  private

  def league_params
    params.require(:league).permit(:name)
  end
  
  def person_league_join_params
    params.require(:person_league_join).permit(:person_id)
  end
  
  def set_event
    @event = Event.last
  end
end
