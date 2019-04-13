class Admins::BlogTagsController < AdminController
  before_action :set_blog_tag, only: [:edit, :update, :destroy]

  def index
    @blog_tags = current_admin.blog_tags
  end

  def new
    @blog_tag = BlogTag.new
  end

  def edit
  end

  def create
    @blog_tag = BlogTag.new(blog_tag_params.merge({admin_id: current_admin.id}))

    if @blog_tag.save
      redirect_to admins_blog_tags_url, notice: "Blog tag was successfully created."
    else
      render :new
    end
  end

  def update
    if @blog_tag.update(blog_tag_params.merge({admin_id: current_admin.id}))
      redirect_to admins_blog_tags_url, notice: "Blog tag was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @blog_tag.destroy
    redirect_to admins_blog_tags_url, notice: "Blog tag was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_blog_tag
    @blog_tag = BlogTag.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def blog_tag_params
    params.require(:blog_tag).permit(:admin_id, :name)
  end
end
