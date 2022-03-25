class PostsController < ApplicationController
    def index
        @post = Post.all.order(id: :desc)
        render status: 202
    end

    def show
        @post = Post.find params[:id]
        @comment_username = @post.comments
        @username = User.find_by_id @post.user_id
        @comment = Comment.new
       
    end
    
    def new
        @post = Post.new
    end

    def create
        @post = Post.new params.require(:post).permit(:title, :body, :user_id)
        @post.user_id = cookies[:user_id]
        if @post.save 
            redirect_to post_path(@post.id)
        else 
            p "could not save post"
            redirect_to root_path
        end
    end

    def destroy
        @post = Post.find params[:id]
        @post.destroy
        redirect_to root_path
        
        

    end

    def edit
        @post = Post.find params[:id]
    end

    def update
        @post = Post.find params[:id]
        if @post.update params.require(:post).permit(:title, :body)
            redirect_to post_path(@post.id)
        else 
            redirect_to edit_post_path
        end
        
    end

    private

    # def post_params
    #     params.require(:post).permit(:title,:body)
    # end
end
