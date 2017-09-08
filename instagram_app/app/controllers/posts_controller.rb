class PostsController < ApplicationController
  def new
  	@post = Post.new
  end

  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def create
  	@post = Post.new(permit_post)
  	if @post.save
  		flash[:success] = "Photo uploaded successfully!"
  		redirect_to post_path(@post)
  	else
  		flash[:error] = @posts.errors.full_messages
  		redirect_to new_post_path
  	end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	@post.update(permit_post)
    if @post.save
  		flash[:success] = "Photo edited successfully!"
  		redirect_to post_path(@post)
  	else
  		flash[:error] = @posts.errors.full_messages
  		redirect_to new_post_path
  	end
  end

  def destroy
  	@post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "Photo successfully deleted!"
  	redirect_to posts_path
  end


  private
	def permit_post
		params.require(:post).permit(:image,:description)
	end
end
