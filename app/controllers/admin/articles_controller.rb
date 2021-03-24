class Admin::ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to admin_article_path(@article), success: success_message(@article)
    else
      flash_error_message
      render :new
    end
  end
  
  private

  def article_params
    params.require(:article).permit(:title, :content).tap do |whitelist|
      whitelist[:creator] = current_user if request.post?
      whitelist[:updater] = current_user if request.put? || request.patch?
    end
  end
  
end
