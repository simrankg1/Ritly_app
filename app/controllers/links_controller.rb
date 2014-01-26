class LinksController < ApplicationController


	def index
		@links= Link.all
		render :index
	end

	def new
		@rit= SecureRandom.urlsafe_base64(4)
		render :new
	end

	def create
		#Link.find_by(url: unique)
		new_rit= params.require(:link).permit(:url, :random_string)
		newer_rit = Link.create(new_rit)
		redirect_to "/links/#{newer_rit.id}"
	end

	def show
		id = params[:id] #
		@link= Link.find(id)
		redirect_to "https://#{link.url}"
	end

end
