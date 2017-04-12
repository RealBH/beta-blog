class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Record Successfully Updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def create
    # render plain: params[:article].inspect # renders to screen
    @article = Article.new(article_params) #Need to whitelist values of Article
    if @article.save
      flash[:notice] = "Record Successfully Created"
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
  
  def destroy
    # First thing is you must find article, or load in what's important
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Record Successfully Removed"
    redirect_to articles_path
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
  
end