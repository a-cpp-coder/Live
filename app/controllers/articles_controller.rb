class ArticlesController < ApplicationController
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

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end


end
