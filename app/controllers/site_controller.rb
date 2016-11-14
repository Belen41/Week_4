class SiteController < ApplicationController
	def home
		render 'home' #name of view template
	end
	def say_name
		@name = params[:name]
		render 'say_name'
	end
end
