require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

helpers do
  def count_interests
    total = 0
    @user_data.each { |_, hash| hash[:interests].each { |_| total += 1 }}
    total
  end
  
  def array_to_list(array)
    array.last.prepend("and ")
    array.join(', ').capitalize + "."
  end
end

before do
  @user_data = Psych.load_file("users.yml")
  @names_array = @user_data.map {|name, _| name}
  @user_count = @user_data.count
end

get "/" do
  @title = "The Metaverse"
  @motto = "Snow Crash free for 35 years"
  erb :home
end

get "/:name" do
  if @user_data.any? {|name, _| name.to_s == params[:name] }
    @name = params[:name]
    @email = @user_data[@name.to_sym][:email]
    @interests = array_to_list(@user_data[@name.to_sym][:interests])
    erb :profile
  else
    erb :page_not_found
  end
end