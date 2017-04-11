class ArticlesController < ApplicationController
  
  def new
    @article = Article.new
  end
  
  def create
    # render plain: params[:article].inspect # renders to screen
    @article = Article.new(article_params) #Need to whitelist values of Article
    if @article.save
      flash[:notice] = "Article Successfully Created!"
      redirect_to article_path(@article)
    else
      #flash[:notice] = "You are dumb, try again"
      render 'new'
    end
    
    #@article.save
    #redirect_to article_path(@article)
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
  
end