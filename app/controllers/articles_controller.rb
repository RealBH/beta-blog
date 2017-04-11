class ArticlesController < ApplicationController
  
  def new
    @article = Article.new
  end
  
  def create
    # render plain: params[:article].inspect # renders to screen
    @article = Article.new(article_params) #Need to whitelist values of Article
    @article.save
    redirect_to articles_show(@article)
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
  
end