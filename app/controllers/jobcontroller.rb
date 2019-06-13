class JobsController < AppController

	get '/:username/requests/:request' do
		@user = current_user
		@reqest = Request.find_by id: params[:request]
		@titles = @reqest.job_titles.map(&:job_title)
		@include = @reqest.parameters.reject(&:exclude).map(&:criteria)
		@exclude = @reqest.parameters.select(&:exclude).map(&:criteria)
		@location = @reqest.locations
		#request last_updated grab for the database
		scrape = Scraper.new
		@titles.each do |title|
			criteria = {:include => @include, :location => @location,:exclude => @exclude,:title => title}
			scrape.scrape_indeed (criteria)
		end
		erb :job
	end

end