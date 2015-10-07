class ProductCodeMatchesController < InheritedResources::Base

  private

    def product_code_match_params
      params.require(:product_code_match).permit(:fare_field_match, :match_expr, :product_code_id)
    end
end

