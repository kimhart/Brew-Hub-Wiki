module App

  class Server < Sinatra::Base
    set :method_override, true
    enable :sessions

    get "/" do
      @user = User.find(session[:user_id]) if session[:user_id] 
      erb :index
    end

    # post "/sessions" do
    #   user = User.find_by({username: params[:username]})
    #   session[:user_id] = user.id
    #   redirect to "/"
    # end

    # get "/logout" do
    #   erb :logout
    # end

    # delete "/sessions" do
    #   session[:user_id] = nil
    #   redirect to "/"
    # end

    # get "/users/new" do
    #    erb :new_user 
    # end
    
    # post "/users" do
    #    User.create(userame: params["username"], age: params["age"], location: params["location"], password: params["password"], password_confirmation: params["password_confirmation"])
    #    redirect to "/"
    # end

    get "/articles" do
      @articles = Article.all
      erb :all_articles
    end

    get "/articles/new" do
      erb :new_article
    end

    post "/articles" do
      Article.create(title: params["title"], date_created: params["date_created"], content: params["content"], img_url: params["img_url"], category_id: params["category_id"])
      redirect to '/articles'
    end

    get "/articles/:id" do
      @article = Article.find(params[:id])
      erb :show_article
    end

    get "/articles/:id/edit" do
      @article = Article.find(params['id'])
      erb :edit_article
    end

    patch "/articles/:id" do
      article = Article.find(params['id'])
      article.update({title: params["name"], content: params["content"], img_url: params["img_url"]})
        redirect to "articles/#{article.id}"
    end

    delete "/articles/:id" do
        id = params[:id]
        article = Article.find(params[:id])
        article.destroy
        redirect to "/articles"
    end

    get "/categories" do
      @categories = Category.all
      erb :categories
    end

  end #Server
end #App 