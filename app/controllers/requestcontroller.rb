class RequestsController < AppController

	get '/:username/requests/new' do
		if !logged_in?
			redirect '/login'
		else
			@user = current_user
			erb :request_new_step1
		end
	end

	post '/:username/requests/new' do
			@user = current_user
			@request = Request.create #({:date_updated => Time.now})
			@user.requests << @request
			params[:job_titles].each do |job_title|
				request.job_titles << JobTitle.create(:job_title => job_title)
			end
			@request.locations << Location.create({:city => "Toronto", :province => "Ontario", :country => "Canada"})
			@user.save
			@request.save
			# binding.pry
			# redirect "/#{@user.username}/requests/new/#{@request.id}/step2"
	end

	get '/:username/requests/new/:cabola/step2' do
		binding.pry
		@user = current_user
		@request = Request.find(params[:request])
		erb :request_new_step2
	end

	post '/:username/requests/new/:request/include' do

	end

end