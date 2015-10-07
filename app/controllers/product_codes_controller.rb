class ProductCodesController < InheritedResources::Base

  private

    def product_code_params
      params.require(:product_code).permit(:desc, :code, :name)
    end
end

