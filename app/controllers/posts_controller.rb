class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    redirect_to hooks_path if params[:hook_id].nil?

    @posts = Post.where(posts: { hook_id: params[:hook_id] })
    @hook = @posts[0].hook
  end

  def show
  end

  def new
    @post = Post.new(Post.empty_fields)
  end

  def create
    @post = Post.new(post_params.to_h)

    if @post.save
      flash[:notice] = t('flash.post.create')
    else
      flash[:error] = t('flash.post.create_error')
    end

    redirect_to posts_path(hook_id: @post.hook.id)
  end

=begin
  def destroy
    if @post.destroy
      flash[:notice] = t("flash.post.destroy")
    else
      flash[:error] = t("flash.post.destroy_error")
    end

    redirect_to posts_path(hook_id: @post.hook.id)
  end
=end

private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:message, :hook_id)
  end
end
