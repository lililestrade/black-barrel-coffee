class DryingProcessesController < ApplicationController
  def index
    #policies = policy_scope(DryingProcess)
    @drying_processes = policy_scope(DryingProcess)

  end

  def show
    @drying_process = DryingProcess.find(params[:id])
    #@drying_process = policy_scope(DryingProcess.find(params[:id]))
    authorize @drying_process

  end

  def new
    @drying_process = DryingProcess.new()
    authorize @drying_process
  end

  def create
    @drying_process = DryingProcess.new(drying_process_params)
    authorize @drying_process
    if @drying_process.save!
      redirect_to drying_processes_path
    else
      render :new
    end
  end

  def edit
    @drying_process = DryingProcess.find(params[:id])
    authorize @drying_process

  end

  def update
    @drying_process = DryingProcess.find(params[:id])
    authorize @drying_process
    if @drying_process.update(drying_process_params)
      redirect_to drying_process_path(@drying_process)
    else
      render :edit
    end
  end

  private

  def drying_process_params
    params.require(:drying_process).permit(:name, :process_time, :description)
  end
end
