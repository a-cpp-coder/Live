class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "Huy", password: "Iam", except: [:index, :show]
  # yeah, see the true meaning of symbol in bookmakr, here we passing 3 hash value (with its key, eg "Huy" with key :name, check the source of the method http_basic) into the method http_basic_authenticate_with

  def index
    @articles = Article.all # with s
  end

  def show
    @article = Article.find(params[:id]) # with no s
  end

  def new
    @article = Article.new
  end

  def create
    # @article = Article.new(title: "...", body: "...") // dummy data
    @article = Article.new(article_params) # real one

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render  :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
