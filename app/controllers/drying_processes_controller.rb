class DryingProcessesController < ApplicationController
  def index
    @drying_processes = DryingProcess.all
  end

  def show
    @drying_process = DryingProcess.find(params[:id])
  end

  def new
    @drying_process = DryingProcess.new
  end

  def create
    @drying_process = DryingProcess.new(drying_process_params)
    if @drying_process.save!
      redirect_to drying_processes_path
    else
      render :new
    end
  end

  private

  def drying_process_params
    params.require(:drying_process).permit(:name, :process_time, :description)
  end
end
