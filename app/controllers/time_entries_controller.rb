class TimeEntriesController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @entries = @project.time_entries.where('date > ?', 1.month.ago.end_of_month)
  end
  def new
    @project = Project.find(params[:project_id])
    @entry= @project.time_entries.new
  end
  def create
    @project = Project.find(params[:project_id])
    @entry = @project.time_entries.new(entry_params)
    if @entry.save
        redirect_to "/projects/#{@project.id}/time_entries"
    else
    render 'new'
    end
  end
  def edit
    @project= Project.find(params[:project_id])
    @entry = @project.time_entries.find(params[:id])
  end
  def update
    @project = Project.find(params[:project_id])
    @entry = @project.time_entries.find(params[:id])
    if @entry.update(entry_params)
      redirect_to "/projects/#{@project.id}/time_entries"
    else
      render 'edit'
    end
  end
  def destroy
    @project=Project.find(params[:project_id])
    @entry = @project.time_entries.find(params[:id])
    @entry.destroy
    redirect_to "/projects/#{@project.id}/time_entries"
  end

  private

  def entry_params
    params.require(:time_entry).permit(:hours, :minutes, :date)
  end
end
