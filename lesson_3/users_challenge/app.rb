require "yaml"

require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"


before do
  @users = YAML.load_file("public/details.yml")
end

helpers do
  def users_count
    @users.keys.size
  end

  def interests_count
    counter = 0
    @users.each do |name, hash|
      counter += hash[:interests].size
    end
    counter
  end
end

get "/" do
  erb :users
end

get "/:name" do
  @name = params[:name]
  erb :user
end