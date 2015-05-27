class FlavorsController <ApplicationController

  def index
    @flavors = Flavor.all
  end

  def new
    @flavor = Flavor.new
  end

  def create
    @flavor = Flavor.new(flavor_params)
    if @flavor.save
      redirect_to flavors_path(@flavor)
    else
      render :new
    end
  end


  private
  def flavor_params
    params.require(:flavor).permit(:name, :url, :allergen, :non_dairy)
  end
end