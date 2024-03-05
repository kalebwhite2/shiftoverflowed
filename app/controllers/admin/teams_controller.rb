class Admin::TeamsController < Admin::BaseController
  before_action :set_team, only: [:show, :destroy_team, :update_team]
  def show 
    # For displaying users to remove
    @users_in_team = @team.users
    # For displaying users to add
    @users = User.search(params[:query]).reject{|u| @users_in_team.include? u}
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
    # Here, each will be assigned to each parameter in a way that resembles in an array of arrays
    # ie, for team_name, p will look like ["team_name", "new_team_name"]
    params.each do |p|
      logger.debug(p)
      # We'll use a switch statement to decide how to update @team
      case p[0]
      when "shift_types"
        # Split splits the string into an array using the delimiting string ", "
        p[1].split(", ").each do |new_shift_type_name|
          # The << symbol assosciates the new shift_type with this @team
          @team.shift_types << ShiftType.new(name: new_shift_type_name)
          flash[:notice] = "Added shift type #{p[1]} to the team."
        end
      when "remove_shift_type"
        # Exclude default value none
        if p[1] != "None" and @team.shift_types.find_by(name: p[1]).destroy
          flash[:notice] = "Removed shift type #{p[1]} from the team."
        end
      when "add_user_ids"
        p[1].each do |id|
          @team.users << User.find(Integer(id))
        end
      when "add_admin"
      when "remove_user"
      when "remove_admin"
      else
        # Exclude default value id
        if p[0] != "id" and Team.column_names.include? p[0]
          @team.update_attribute(p[0], p[1])
          flash[:notice] = "Set team #{p[0]} to #{p[1]}."
        end
      end
    end
    if @team.save
    else
      flash[:alert] = "Failed to update team."
    end
    redirect_to admin_team_url(@team)
  end

  def destroy_team
    if @team.destroy
      flash[:notice] = "Team deleted succesfully!"
      redirect_to admin_teams_path
    else
      flash[:alert] = "Failed to delete team."
      redirect_to admin_team_url(@team)
    end
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