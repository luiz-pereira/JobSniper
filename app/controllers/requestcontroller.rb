class RequestsController < AppController

	get '/index' do
		@requests = current_user.requests
		erb :index
	end



end