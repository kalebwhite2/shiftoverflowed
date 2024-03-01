class Admin::TeamsController < Admin::BaseController
  before_action :set_team, only: :show

  def show 
  
  end

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

  def update_team
  end

  private
  # This is used a "callback", a function for commen setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end
    

  # Validate any created teams 
  def team_params
    params.require(:team).permit(:team_name, :invite_code, :admin_invite_code)
  end

end