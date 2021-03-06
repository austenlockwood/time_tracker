# RuboCop wants a top-level class documentation comment here
class ProjectsController < ApplicationController
  before_action :check_for_authorized_user
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params['id'])
  end

  def update
    @project = Project.find(params['id'])

    if @project.update(project_params)
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params['id'])
    if @project.destroy
      redirect_to projects_path, notice: "Project '#{@project.name}' successfully deleted!"
    else
      redirect_to projects_path, notice:
      @project.errors.full_messages.join("\n")
    end
  end

  private def project_params
    params.require('project').permit(
      :name,
      :max_minutes
    )
  end
end
