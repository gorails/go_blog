module Blog
  class PostsController < ApplicationController
    before_action :set_blog_post, only: [:show, :edit, :update, :destroy, :show_list]
    before_action :authenticate_user!, except: [:list, :show_list]
    load_and_authorize_resource except: [:list, :show_list, :create]
    # GET /blog/posts
    def index
      if params[:tag]
        @blog_posts = Post.tagged_with(params[:tag]).page params[:page]
      else
        @blog_posts = Post.all.page params[:page]
      end
    end

    def list

      if params[:tag]
        @blog_posts = Post.tagged_with(params[:tag]).page params[:page]
      else
        @blog_posts = Post.where('? >= published_at and draft = ?', DateTime.now, false).includes(:user).page params[:page]
      end
    end

    # GET /blog/posts/1
    def show
    end

    def show_list
      @blog_post.increment!(:access_count)
    end

    # GET /blog/posts/new
    def new
      @blog_post = Post.new
    end

    # GET /blog/posts/1/edit
    def edit
    end

    # POST /blog/posts
    def create
      authorize! :create, @blog_post
      @blog_post = Post.new(blog_post_params)

      if @blog_post.save
        redirect_to @blog_post, notice: 'Post was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /blog/posts/1
    def update
      if @blog_post.update(blog_post_params)
        redirect_to @blog_post, notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /blog/posts/1
    def destroy
      @blog_post.destroy
      redirect_to blog_posts_url, notice: 'Post was successfully destroyed.'
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_post
      @blog_post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def blog_post_params
      params.require(:blog_post).permit(:title, :teaser, :body, :draft, :published_at, :user_id, :custom_url, :access_count,:all_tags)
    end
  end
end
