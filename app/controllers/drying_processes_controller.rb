class DryingProcessesController < ApplicationController
  def index
    @drying_processes = DryingProcess.all
  end

  def show
    @drying_process = DryingProcess.find(params[:id])
  end
end
