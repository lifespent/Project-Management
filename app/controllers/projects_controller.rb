class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  def index
    if !params[:company_id] 
      @projects = Project.find :all
    else
      @projects = Project.find :all, :conditions => ['company_id = ?', params[:company_id]]
      @companies =  Company.all
    end
     if @projects.count == 0 or !params[:company_id] 
        redirect_to(root_path) # Create A Project Page
    else
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
        @project = Project.find(params[:id])
        @milestone = Milestone.find :all, :order => 'position', :conditions => ['project_id = ?', params[:id]] 
       if project_owner?(@project.id) == true
        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @project }
        end
    else 
        redirect_to('/401')
    end
        
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
     if params[:company_id] 
        @companies = Company.find :all, :conditions => ['id = ?', params[:company_id]] 
        @companies.each do |company|
          @company_name = company.name
          @company_user = company.user_id
          @company_id = company.id
      end
    end
     if @company_user.to_f == current_user.id 
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
   else 
     redirect_to('/401')
  end
  end

  # GET /projects/1/edit
  def edit

    @project = Project.find(params[:id])
  if project_owner?(@project.id) == true
     @companies =  Company.all
   else 
     redirect_to('/401')
    end
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
      @project = Project.find(params[:id])
      if project_owner?(@project.id) == true
      @project.update_attributes!(params[:project])

      respond_to do |format|
        format.html do
          if request.xhr?
            # *** repond with the new value ***
            render :text => params[:project].values.first
          else
            redirect_to(@project, :notice => 'Project was successfully updated.')
          end
        end
      end
      else 
         redirect_to('/401')
        end
    end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    if project_owner?(@project.id) == true
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  else 
  redirect_to('/401')
end
end
end
