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
			user = current_user
			request = Request.create
			user.requests << request
			params[:job_titles].each do |job_title|
				request.job_titles << JobTitle.create(:job_title => job_title)
			end
			request.locations << Location.create({:city => "Toronto", :province => "Ontario", :country => "Canada"})
			user.save
			erb :request_new_step2
	end

end