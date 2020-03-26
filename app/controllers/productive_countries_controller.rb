class ProductiveCountriesController < ApplicationController
  def create
    @productive_country = ProductiveCountry.new(productive_country_params)
    authorize @productive_country
    # we need `variety_id` to associate productive_country with corresponding variety
    # @variety = Variety.find(params[:id])
    # @productive_country.variety_id = @variety
    # @productive_country.save
    if @productive_country.save!
      flash[:notice] = 'Successfully created productive_country.'
      redirect_to variety_path(@productive_country.variety_id)
    else
      render :new
    end
  end

  def destroy
    @productive_country = ProductiveCountry.find(params[:id])
    authorize @productive_country

    @productive_country.destroy

    # no need for app/views/productive_countrys/destroy.html.erb
    redirect_to variety_path(@productive_country.variety_id)
  end

  private

  def productive_country_params
    params.require(:productive_country).permit(:variety_id, :country_id, :address)
  end
end
