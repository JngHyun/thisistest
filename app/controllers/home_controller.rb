class HomeController < ApplicationController
  #create
  
  def create
    @post = Post.new
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.image=params[:image]
    @post.save
    redirect_to "/home/show/#{@post.id}"
  end
  
  #read
  def index
    @posts = Post.all
    @comments = Comment.where(:post_id => params[:post_id])
  end

  def show
    @post = Post.find(params[:post_id])
  end

 
 #update
  def edit
    @post = Post.find(params[:post_id])
  end
  
  def update
    @post = Post.find(params[:post_id])
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.save
    redirect_to "/home/show/#{@post.id}"
  end
  
 #destroy
  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy
    redirect_to '/'
  end
  
end