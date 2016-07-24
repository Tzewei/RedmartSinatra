class RedmartSinatraApp < Sinatra::Base
  # get '/' do # this is the route, a ROOT route. our homepage!
  #    erb 'Test Here.' # this is the view we're going to render, straight text
  # end

  #1.Show all Records
  get "/users" do
    @users = User.all
    erb :'users/index' # this is the path to our view file!
  end

  # get "/users/:id" do
  #   @user = User.find(params[:id])
  #   erb :'users/show' # this is the path to our show file!
  # end

  #2.GET FORM VIEW TO CREATE NEW artist
  #Add new Name; Check if its requesting
  #for entering new data. If not display it
  get '/users/:id' do
    if params[:id] == 'new'
      erb :'users/new'
    else
      @user = User.find(params[:id])
      erb :'users/show'
    end
  end

  #3.update User by ID
  get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :"users/edit"
  end

  #4. Add or Create record to actual Database
  post '/users' do
    puts params[:user]
    @new_user = User.new(params[:user])

    if @new_user.save  #save return true if success
      redirect("/users")
    else
      erb :"users/new"
    end
  end

  # save is a Rails method defined within the ActiveRecord::Persistence module. It saves the model. If the model is new, a record gets created in the database, otherwise the existing record gets updated.
  # By default, save always run validations. If any of them fail the action is cancelled and save returns false. However, if you supply :validate => false, validations are bypassed altogether.
  # There’s a series of callbacks associated with the save method. If any of the before_* callbacks return false the action is cancelled and save returns false.

  #5. Update record to specific id of database
  put '/users/:id' do
    @update_user = User.find(params[:id])
    if @update_user.update_attributes( params[:user] )
      redirect("/users")
    end
  end

  #6. Delete Record
  delete '/users/:id' do
    @delete_user = User.find( params[:id])
    if @delete_user.destory
      redirect("/users") # go to all artist list
    else
      erb :"users/#{ @delete_user.id }"
    end
  end
end
