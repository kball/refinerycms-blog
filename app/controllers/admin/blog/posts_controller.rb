class Admin::Blog::PostsController < Admin::BaseController

  crudify :blog_post,
          :title_attribute => :title,
          :order => 'published_at DESC'

  before_filter :add_author_id, :only => [:create]
  before_filter :find_all_categories,
                :only => [:new, :edit, :create, :update]

protected

  def add_author_id
    params[:blog_post][:author_id] = current_user.id
  end

  def find_all_categories
    @blog_categories = BlogCategory.find(:all)
  end
end
