class MilestonesController < ApplicationController
  # GET /milestones
  # GET /milestones.json
  def index
    redirect_to(projects_path)
  end

  # GET /milestones/1
  # GET /milestones/1.json
  def show
    @milestone = Milestone.find(params[:id])
    @project_id = @milestone.project_id
    if !@project_id.blank?
        redirect_to project_path(@project_id)
    end
  end

  # GET /milestones/new
  # GET /milestones/new.json
  def new
     redirect_to(projects_path)
  end

  # GET /milestones/1/edit
  def edit
   redirect_to(projects_path)
  end

  # POST /milestones
  # POST /milestones.json
  def create
    redirect_to(projects_path)
  end

  # PUT /milestones/1
  # PUT /milestones/1.json
  def update
    @milestone = Milestone.find(params[:id])
    @milestone.update_attributes!(params[:milestone])

    respond_to do |format|
      format.html do
        if request.xhr?
          # *** repond with the new value ***
          render :text => params[:milestone].values.first
        else
          redirect_to(@milestone, :notice => 'User was successfully updated.')
        end
      end
    end
  end
  
  def sort
    params[:milestone].each_with_index do |id, index|
      Milestone.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end

  # DELETE /milestones/1
  # DELETE /milestones/1.json
  def destroy
    @milestone = Milestone.find(params[:id])
    @project_id = @milestone.project_id
    @milestone.destroy

    respond_to do |format|
      format.html { redirect_to project_path(@project_id) }
      format.json { head :no_content }
    end
  end
end
