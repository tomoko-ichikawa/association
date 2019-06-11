class BlogsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    
  def new
      @blog = Blog.new
  end
  
  def create
      @blog = Blog.new(blog_params)
      @blog.user_id = current_user.id
      @blog.save
      redirect_to blogs_path
  end

  def index
      @blogs = Blog.all
  end

  def show
      @blog = Blog.find(params[:id])
      @user = @blog.user
  end
  
  def edit
      @blog = Blog.find(params[:id])
      @user = @blog.user
  end
  
  def update
      @blog = Blog.find(params[:id])
      @user = @blog.user
      if @blog.update(blog_params)
          redirect_to users_path,notice:"ブログを編集しました！"
      else
          render'edit'
      end
  end
  
  private
    def blog_params
        params.require(:blog).permit(:title, :content)
    end
end
