class UsersController < AppController

	get '/signup' do
		logout
		erb :signup
	end

	post '/signup' do
		if User.find_by(username: params[:user][:username])
			erb :signup_failure
		end
		user = User.create(params)
		session[:user_id] = user.id
	end

	get '/login' do
		logout
		erb :login
	end

	post '/login' do
		user = User.find_by(username: params[:user][:username])
		if user && user.authenticate(params[:user][:password])
			session[:user_id] = user.id
			redirect '/index'
		else
			erb :login_failure
		end
	end


end