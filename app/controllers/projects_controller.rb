class ProjectsController < ApplicationController
  def index
    @projects = Project. order(created_at: :desc).limit(100)
  end

  def show
    @my_project = Project.find_by(id: params[:id])
    unless @my_project
      render "project_not_found"
    end
  end

  def new
    @new_project = Project.new
  end

  def create
    @new_project = Project.new(
      :name=> params[:project][:name],
      :description => params[:project][:description])
    @new_project.save

    redirect_to '/projects/#{@new_project.id}'
  end
end
