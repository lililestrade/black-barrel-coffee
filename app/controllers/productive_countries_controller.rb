class ProductiveCountriesController < ApplicationController
  # def new
  #   @variety = Variety.find(params[:variety_id])
  #   @productive_country = ProductiveCountry.new
  # end

  # def create
  #   @variety = Variety.find(params[:id])
  #   @productive_country = ProductiveCountry.new(productive_country_params)
  #   authorize @productive_country

  #   if @productive_country.save!
  #     flash[:notice] = 'Successfully created productive_country.'
  #     redirect_to variety_path(@variety)
  #   else
  #     render :new
  #   end
  # end

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

  private

  def productive_country_params
    params.require(:productive_country).permit(:variety_id, :country_id, :address)
  end
end
