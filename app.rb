class RedmartSinatraApp < Sinatra::Base
  # get '/' do # this is the route, a ROOT route. our homepage!
  #    erb 'Test Here.' # this is the view we're going to render, straight text
  # end

  get "/users" do
  @users = User.all
    erb :'users/index' # this is the path to our view file!
  end

  get "/users/:id" do
    @user = User.find(params[:id])
    erb :'users/show'
  end





end
