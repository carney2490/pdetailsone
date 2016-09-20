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
	redirect '/3_fav_nums?name=' + name + "&age=" + age
end 

get '/3_fav_nums' do
	name = params[:name]
	age = params[:age]
	erb :get_fav, :locals => {:name => name, :age => age}
end

post '/3_fav_nums' do
	age = params[:age]
	name = params[:name]
	fav1 = params[:users_fav1]
	fav2 = params[:users_fav2]
	fav3 = params[:users_fav3]
	"Mahalo #{name}.  Your favorite numbers are #{fav1}, #{fav2}, #{fav3} and the do not add up to #{age}."
end 

# get '/hair' do
# 	hair = params[:hair]
# 	erb :get_hair, :locals => {:age => age}
# end

# post "/the_users_hair" do
# 	hair = params[:hair]
# end

# "Congrats #{name} on surviving #{age} way to keep on keepin on!"