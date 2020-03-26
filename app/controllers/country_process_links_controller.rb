class CountryProcessLinksController < ApplicationController
  def create
    @country_process_link = CountryProcessLink.new(country_process_link_params)
    authorize @country_process_link
    # we need `variety_id` to associate productive_country with corresponding variety
    # @variety = Variety.find(params[:id])
    # @productive_country.variety_id = @variety
    # @productive_country.save
    if @country_process_link.save!
      flash[:notice] = 'Successfully created productive_country.'
      redirect_to country_path(@country_process_link.country_id)
    else
      render :new
    end
  end

  def destroy
    @country_process_link = CountryProcessLink.find(params[:id])
    authorize @country_process_link

    @country_process_link.destroy

    # no need for app/views/country_process_links/destroy.html.erb
    redirect_to country_path(@country_process_link.country_id)
  end

  private

  def country_process_link_params
    params.require(:country_process_link).permit(:country_id, :drying_process_id)
  end
end
