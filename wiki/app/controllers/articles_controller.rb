class ArticlesController < ApplicationController
  before_action :set_article, only:[:show,:edit,:update,:destroy]
  before_action :authenticate_user!, except:[:index, :show]

  def index
    if params[:category_id].blank?
      @articles = Article.all.order('created_at DESC')
    else
      @articles = Article.where(category_id: params[:category_id]).order('created_at DESC')
    end
  end

  def show
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update_attributes(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path, notice: "Article successfuly deleted"
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title,:content,:category_id)
  end

end