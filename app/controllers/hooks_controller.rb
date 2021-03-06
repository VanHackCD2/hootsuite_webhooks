class HooksController < ApplicationController
  before_action :set_hook, only: [:show, :edit, :update, :destroy]

  def index
    @hooks = Hook.all
  end

  def show
    @post = Post.new(Post.empty_fields)
  end

  def new
    @hook = Hook.new(Hook.empty_fields)
  end

  def create
    @hook = Hook.new(hook_params.to_h)

    if @hook.save
      flash[:notice] = t('flash.hook.create')

      redirect_to hooks_path
    else
      flash[:error] = t('flash.hook.create_error')

      render :new
    end
  end

  def edit
  end

  def update
  	Hook.set(@hook, hook_params)

    if @hook.save
      flash[:notice] = t('flash.hook.update')

      redirect_to hooks_path
    else
      flash[:error] = t('flash.hook.update_error')

      render :edit
    end
  end

  def destroy
    if @hook.destroy
      flash[:notice] = t("flash.hook.destroy")
    else
      flash[:error] = t("flash.hook.destroy_error")
    end

    redirect_to hooks_path
  end

private

  def set_hook
    @hook = Hook.find(params[:id])
  end

  def hook_params
    params.require(:hook).permit(:url)
  end
end
