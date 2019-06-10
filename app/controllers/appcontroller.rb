class AppController < Sinatra::Base

	enable :sessions
	set :session_secret, "ultra-confidential"

	configure do
		# set :public_folder, 'public'
		set :views, 'app/views'
	end

	get '/' do
		erb :home
	end


	helpers do
		def current_user
			User.find(session[:user_id])
		end

		def logged_in?
			!!session[:user_id]
		end

		def logout
			session.clear
		end
	end

end
