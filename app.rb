require 'sinatra'
   
get '/' do # / is the root and everything after it is following the root
	erb :get_name #this is the file name of the erb
end

post '/the_users_name' do # this is in line 3 of the erb under action
	name = params[:user_name] # this is found on the erb line 4 under name equals
	redirect '/age?users_name=' + name # this points to /age and the ?users_name passes the paramater users_name to the following function
end

get '/age' do
	name = params[:users_name]
	erb :get_age, :locals => {:name => name}
end

post '/age' do
	age = params[:age]
	name = params[:retrieved_name]
	"Congrats #{name} on surviving #{age} way to survive!"
end 

# get '/hair' do
# 	hair = params[:hair]
# 	erb :get_hair, :locals => {:age => age}
# end

# post "/the_users_hair" do
# 	hair = params[:hair]
# end

