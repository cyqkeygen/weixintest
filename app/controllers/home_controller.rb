class HomeController < ApplicationController

	def valid_token
		valid_array = []
		signature = params[:signature]
		valid_array << params[:timestamp]
		valid_array << params[:nonce]
		valid_array << Weixindemo::Application.config.app_token
		valid_array = valid_array.compact.sort
		valid_data = Digest::SHA1.hexdigest(valid_array.join)
		if valid_data == signature
			return true
		else
			return false
		end
	end

	def index
		
	end

end
