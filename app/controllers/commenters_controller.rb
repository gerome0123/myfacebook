class CommentersController < ApplicationController
  before_action :find_post
  before_action :find_comment, only: [:destroy, :edit, :update]
  load_and_authorize_resource :only => [:edit]


  def create
    @comment = @post.commenters.create(params[:commenter].permit(:comment))
    @comment.user_id = current_user.id
    @comment.save

    if @comment.save
      respond_to do |format|
      format.html {redirect_to posts_path}
      format.js { render :action => 'create' }
      end  

    else
        redirect_to posts_path
    end
  end

  def destroy
    @comment.destroy
    redirect_to posts_path(@post)
  end

  def edit

  end

  def update
    if @comment.update(params[:commenter].permit(:comment))
      authorize! :read, @comment
      redirect_to posts_path(@post)
    else
      render 'edit'
    end

  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = @post.commenters.find(params[:id])
  end

end
