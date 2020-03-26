class HarvestPeriodsController < ApplicationController
  def create
    @harvest_period = HarvestPeriod.new(harvest_period_params)
    authorize @harvest_period
    # we need `variety_id` to associate productive_country with corresponding variety
    # @variety = Variety.find(params[:id])
    # @productive_country.variety_id = @variety
    # @productive_country.save
    if @harvest_period.save!
      flash[:notice] = 'Successfully adding a month of harvest.'
      redirect_to country_path(@harvest_period.country_id)
    else
      render :new
    end
  end

  def destroy
    @harvest_period = HarvestPeriod.find(params[:id])
    authorize @harvest_period

    @harvest_period.destroy

    # no need for app/views/harvest_periods/destroy.html.erb
    redirect_to country_path(@harvest_period.country_id)
  end

  private

  def harvest_period_params
    params.require(:harvest_period).permit(:country_id, :month_id)
  end
end
