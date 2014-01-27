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
	end

	def go
		link = Link.find_by(:random_string => params[:random_string])
		x = link.url
		if x.match("http://") != nil
			redirect_to "#{x}"
		elsif x.match("www.") != nil
			redirect_to "http://" + "#{x}"
		else
			redirect_to "http://www." + "#{x}"
		end
	end








	 # def preview
  #          @link = Link.find_by(:random_string => params[:random_string])
  #    end


	# def go
	# 	id= params[:url]
	# 	 link = Link.find_by_url(:url)
	# 	redirect_to "http://#{link.url}"
	# end

end
