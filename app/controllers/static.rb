get '/' do
	@url = Url.limit(10).order(id: :desc)
  	erb :"static/index"
end


post '/submit-post' do
@url = Url.new(long_url: params["long_url"])
	if @url.save
		@url.to_json
	else
		status 404
		@url.errors.full_messages


		if params["long_url"].blank?
			{error_message: "Please enter a URL!"}.to_json
		else
			@url = Url.find_by(long_url: params["long_url"])

			if @url.nil?
				{error_message: "Invalid URL format!"}.to_json
			else
				{error_message: "This URL has already been shortened!"}.to_json
			end

		end
	end

end


get '/:short_url' do
	@url = Url.find_by(short_url: params["short_url"])

	if @url.nil?
		redirect '/'
	else
		@url.count
    	redirect @url.long_url
    end
end





