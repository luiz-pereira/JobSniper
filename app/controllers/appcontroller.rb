class AppController < Sinatra::Base

	require 'sinatra/flash'
	enable :sessions
	set :session_secret, "ultra-confidential"
	register Sinatra::Flash

	configure do
		# set :public_folder, 'public'
		set :views, 'app/views'
	end

	get '/' do
		erb :home
	end


	helpers do
		def current_user
			User.find_by id: session[:user_id]
		end

		def logged_in?
			!!current_user
		end

		def logout
			session.clear
		end
	end

end
