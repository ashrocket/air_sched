class FaresController < InheritedResources::Base

  private

    def fare_params
      params.require(:fare).permit(:fbc, :source, :base_amount, :origin, :dest)
    end
end

