class Admins::BlogArticlesController < AdminController
  before_action :set_article, only: [:edit, :update, :destroy]
  before_action :set_admin_tags, only: [:new, :edit]

  def index
    @articles = current_admin.blog_articles
  end

  def new
    @article = BlogArticle.new
  end

  def create
    @article = BlogArticle.new(article_params.merge({admin_id: current_admin.id}))
    if @article.save
      @article.set_tags(current_admin, params[:blog_tags])
      redirect_to admins_blog_articles_path
    else
      render action: 'new'
    end
  end

  def edit
    @article_tag_ids = @article.blog_tags.pluck(:id)
  end

  def update
    if @article.update(article_params.merge({admin_id: current_admin.id}))
      @article.set_tags(current_admin, params[:blog_tags])
      redirect_to admins_blog_articles_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to admins_blog_articles_path
  end

  private

  def set_admin_tags
    @tags = current_admin.blog_tags
  end
  
  def set_article
    @article = current_admin.blog_articles.find(params[:id])
  end

  def article_params
    params.require(:blog_article).permit(:title, :content, :admin_id)
  end
end