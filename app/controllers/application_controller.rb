class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 	#protect_from_forgery with: :exception
 	protect_from_forgery with: :null_session

	def set_admin_locale
	  I18n.locale = :en
	end

	private
		def set_brand_layout
			@brand_layout = AppControl.singleton.brand.layout_key
		end
		def select_layout
		 if template_exists?('application', File.join('layouts', @brand_layout))
				 File.join('layouts', @brand_layout, 'application')
		 else
			 'application'
		 end
		end
		def set_branded_viewpath
			if @brand_layout
				prepend_view_path "#{Rails.root}/app/views/#{@brand_layout}"
			end
		end
end
