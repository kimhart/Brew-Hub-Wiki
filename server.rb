module App

  class Server < Sinatra::Base
    set :method_override, true
    enable :sessions

    $markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})

    get "/" do
      @user = User.find(session[:user_id]) if session[:user_id]
      redirect to "/login" if !@user 
      erb :index
    end

    get "/login" do
      erb :login
    end

    post "/sessions" do
      user = User.find_by({username: params[:username]})
      session[:user_id] = user.id
      redirect to "/"
    end

    get "/logout" do
      erb :logout
    end

    delete "/sessions" do
      session[:user_id] = nil
      redirect to "/"
    end

    get "/users/new" do
       erb :new_user 
    end
    
    post "/users" do
       User.create(username: params["username"], password: params["password"], password_confirmation: params["password_confirmation"], first_name: params["first_name"], last_name: params["last_name"], location: params["location"])
       redirect to "/"
    end

    get "/articles/?" do
      @articles = Article.all
      erb :all_articles
    end

    get "/articles/new/?" do
      erb :new_article
    end

    get "/articles/:id/?" do
      @article = Article.find(params['id'])
      erb :show_article
    end

    get "/articles/:id/edit/?" do
      @categories = Category.all
      @article = Article.find(params['id'])
      erb :edit_article
    end

    post "/articles/?" do
      @user = User.find(session[:user_id])
      Article.create(author_id: @user.id, title: params["title"], date_created: params["date_created"], content: params["content"], img_url: params["img_url"], category_id: params["category_id"], user_id:["user_id"])
      redirect to '/articles'
    end

    patch "/articles/:id/?" do
      @user = User.find(session[:user_id])
      article = Article.find(params['id'])
      article.update({editor_id: @user.id, title: params["title"], content: params["content"], img_url: params["img_url"]})
      redirect to "articles/#{article.id}"
    end

    delete "/articles/:id/?" do
        id = params[:id]
        article = Article.find(params['id'])
        article.destroy
        redirect to "/articles"
    end

    get "/categories/?" do
      @categories = Category.all
      erb :categories
    end

  end #Server
end #App 