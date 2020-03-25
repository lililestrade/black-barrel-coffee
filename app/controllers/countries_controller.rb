class CountriesController < ApplicationController
  def index
    @countries = policy_scope(Country)
    #@countries = Country.all

  end

  def show
    #@country = policy_scope(DryingProcess.find(params[:id]))
    @country = Country.find(params[:id])
    authorize @country

    @country_process_link = CountryProcessLink.new()
    authorize @country_process_link
  end

  def new
    @country = Country.new()
    authorize @country
  end

  def create
    @country = Country.new(country_params)
    authorize @country

    if @country.save!
      flash[:notice] = 'Successfully created country.'
      redirect_to countries_path
    else
      render :new
    end
  end

  private

  def country_params
    params.require(:country).permit(:name, :annual_prod, :world_rank, :world_market_share, :description,
                                      harvest_periods_attributes: [:id, :month_id, :_destroy],
                                      country_process_links_attributes: [:id, :drying_process_id, :_destroy])
  end

end
