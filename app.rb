require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:my_webapp_database.sqlite3"

require './models'

get '/sign-in' do
	erb :signin
end

get '/' do
	erb :home
end

get '/login-failed' do
	erb :failed
end

post '/sign-in' do 
	puts "my params are " + params.inspect
	@user = User.where(username: params[:username]).first
  if @user.password == params[:password]
    redirect '/'
  else
    redirect '/login-failed'
  end
end