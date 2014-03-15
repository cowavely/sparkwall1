class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:show, :index, :search, :tagged]  

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  # def like
  #   @project = Project.find(params[:id])
  #   type = params[:type]  

  #   if current_user.liked_project?(@project)
  #     current_user.like!(@project)
  #     redirect_to :back, notice: 'You favorited #{@project.name}'

  #   elsif current_user.liked_project?(@project) == false
  #     current_user.unlike!(@project)
  #     redirect_to :back, notice: 'Unfavorited #{@project.name}'

  #   else
  #     redirect_to :back, notice: 'Nothing happened.'
  #   end

  # end

  def add_to_wishlist
    @project = Project.find(params[:project_id])
    current_user.add_to_wishlist(@project)
    respond_to do |format|
      format.js
      format.html { redirect_to :back }
      #format.json { render action: 'show', status: :created, location: @like }
    end
  end

  def remove_from_wishlist
    @project = Project.find(params[:project_id])
    current_user.remove_from_wishlist(@project)
    respond_to do |format|
      format.js
      format.html { redirect_to :back }
      #format.json { render action: 'show', status: :created, location: @like }
    end
  end

  def tagged
    if params[:tag].present? 
      @projects = Project.tagged_with(params[:tag])
      @tags = params[:tag]
    else 
      @projects = Project.postall
    end  
  end

  def reaction_tagged
    if params[:reaction].present? 
      @projects = Project.tagged_with(params[:reaction], :on => :reactions)
      @tags = params[:reaction]
    else 
      @projects = Project.postall
    end 
  end

  def search
      # @projects = Project.where(["title LIKE ? or description LIKE ?" , "%#{params[:project][:title]}%", "%#{params[:project][:title]}%"])
      @projects = Project.where("header LIKE ?", params[:query])
      render "index"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:header, :description, :image, :user_id, :tag_list, :reaction_list, :reflection)
    end
end
