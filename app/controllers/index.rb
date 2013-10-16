get '/' do
  @posts = Post.all
  erb :index
end   


get '/login' do
  erb :login
end

post '/login' do
  if params[:submit] == 'Login'
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect '/'
    else
      @login_error = "Invalid login"
      erb :login
    end
  elsif params[:submit] == 'Signup'
    user = User.create(name: params[:name], password: params[:password])
    if user.valid?
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect to('/') 
    else
      @signup_error = "Username already exists"
      erb :login
    end
  end
end

get '/create' do 
  erb :create
end

post '/create' do
  post = Post.create(title: params[:title], link: params[:link], user_id: session[:user_id])
  redirect to("/comment/#{post.id}")
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/user/:id' do
  @user = User.find(params[:id])

  erb :user
end

get '/user_posts/:id' do
  @posts = Post.where(user_id: params[:id])
  @user = User.find(params[:id])
  erb :user_posts
end

get '/comment/:post_id' do
  @comments = Comment.where(post_id: params[:post_id])
  @post = Post.find(params[:post_id])
  erb :comments
end

get '/create_comment/:post_id' do
  @post = Post.find(params[:post_id])
  erb :create_comment
end

post '/create_comment/:post_id' do
  @comment = Comment.create(paragraph: params[:paragraph], user_id: session[:user_id], post_id: params[:post_id])
  redirect ("/comment/#{params[:post_id]}")
end

get '/user_comments/:user_id' do
  @user = User.find(params[:user_id])
  @comments = Comment.where(user_id: @user.id)
  erb :user_comments
end 

get '/users' do
  @users = User.all
  erb :list_users
end

get '/delete_post/:post_id' do
  Post.destroy(params[:post_id])
  redirect to(params[:current_page])
end

get '/profile/:user_id' do
  erb :update_user
end

get '/delete_user/:user_id' do
  session.clear
  User.destroy(params[:user_id])
  redirect ('/')
end
