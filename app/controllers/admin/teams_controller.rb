class Admin::TeamsController < Admin::BaseController
  def teams 
    @teams = Team.all
  end

  def team_form
    # Create a local object for the form to use
    @team = Team.new
  end

  def create_team
    # Validate the post request using the private helper method
    @team = Team.new(team_params)

    # Persist the team
    if @team.save
      flash[:notice] = "Team created succesfully!"
      redirect_to admin_teams_path
    end
  end

  private

  # Validate any created teams 
  def team_params
    params.require(:team).permit(:team_name, :invite_code, :admin_invite_code)
  end

end