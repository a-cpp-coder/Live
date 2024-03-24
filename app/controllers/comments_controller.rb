class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article) # using the article_path(@article) helper. As we have already seen, this calls the show action of the ArticlesController which in turn renders the show.html.erb template.
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
