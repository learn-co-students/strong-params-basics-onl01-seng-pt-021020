class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
    @post = Post.new(post_params(:title, :description))
    @post.save
    redirect_to post_path(@post)
  end
 
  def update
    @post = Post.find(params[:id])
    @post.update(post_params(:title))
    redirect_to post_path(@post)
  end
  
  def edit
	  @post = Post.find(params[:id])
	end
 
  private
 
 
# We pass the permitted fields in as *args;
# this keeps `post_params` pretty dry while
# still allowing slightly different behavior
# depending on the controller action. This
# should come after the other methods
 
  def post_params(*args)
    params.require(:post).permit(*args)
  end
  
  
end




#require is more restrictive 

#require means that params that get passed from the uer MUST contain a key called post. Otherwise it fails and the user gets an error. 

#permit is looser. It means that params hash may have whatever keys are in it. 
