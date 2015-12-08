module App

  class Server < Sinatra::Base
    set :method_override, true
    enable :sessions

    $markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, space_after_headers: true, tables: true, quote: true, underline: true)

    get "/" do
      @user = User.find(session[:user_id]) if session[:user_id]
      redirect to "/login" if !@user
      erb :index
    end

    get "/login/?" do
      erb :login
    end

    get "/login/try-again" do
      erb :wrong_password
    end

    post "/sessions" do
      user = User.find_by({username: params[:username]}).try(:authenticate, params[:password])
      if user
      session[:user_id] = user.id
      redirect to "/"
      else 
      redirect to "/login/try-again"
      end
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

    get "/users/thanks-for-signing-up" do
      erb :thanks
    end
    
    post "/users" do
       User.create(username: params["username"], password: params["password"], password_confirmation: params["password_confirmation"], first_name: params["first_name"], last_name: params["last_name"], location: params["location"])
       redirect to "/users/thanks-for-signing-up"
    end

    get "/articles/?" do
      @user = User.find(session[:user_id]) if session[:user_id]
      @articles = Article.all
      erb :all_articles
    end

    get "/articles/new" do
      @user = User.find(session[:user_id]) if session[:user_id]
      erb :new_article
    end

    get "/articles/:id" do
      @user = User.find(session[:user_id]) if session[:user_id]
      @article = Article.find(params['id'])
      erb :show_article
    end

    get "/articles/:id/edit" do
      @user = User.find(session[:user_id]) if session[:user_id]
      @categories = Category.all
      @article = Article.find(params['id'])
      erb :edit_article
    end

    post "/articles/new" do
      @user = User.find(session[:user_id])
      @categories = Category.all
      article = Article.create({
        author_id: @user.id, 
        date_created: params["date_created"], 
        title: params["title"], 
        category_id: params["category_id"],
        content: params["content"], 
        img_url: params["img_url"]})
      c1 = Category.find(params[:category_id])
      article.categories.push(c1)
      redirect to '/articles'
    end

    patch "/articles/:id" do
      @user = User.find(session[:user_id])
      @categories = Category.all
      article = Article.find(params['id'])
      article.update(
        editor_id: @user.id, 
        title: params["title"], 
        category_id: params["category_id"],
        content: params["content"], 
        img_url: params["img_url"])
      c1 = Category.find(params[:category_id])
      article.categories.clear
      article.categories.push(c1)
      redirect to "articles/#{article.id}"
    end

    delete "/articles/:id" do
        id = params[:id]
        article = Article.find(params['id'])
        article.destroy
        redirect to "/articles"
    end

    get "/categories/?" do
      @user = User.find(session[:user_id]) if session[:user_id]
      @categories = Category.all
      erb :categories
    end

    get "/categories/:id" do
      @user = User.find(session[:user_id]) if session[:user_id]
      @category = Category.find(params['id'])
      @articles = @category.articles
      erb :show_category




    end 

  end #Server
end #App 