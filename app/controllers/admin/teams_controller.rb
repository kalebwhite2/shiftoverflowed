class Admin::TeamsController < Admin::BaseController
  def teams 
    
  end

  def create_team
    @team = Team.new
  end
end