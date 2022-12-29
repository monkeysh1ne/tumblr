class PostsController < ApplicationController

    def index
        @posts = Post.all.order('created_at DESC')
    end

    def new
        @post = Post.new
    end

    def create
        respond_to do |format|
            @post = Post.new(post_params)
            if @post.save
              format.html { redirect_to @post }
            else
              # NOTE: this will render `new.erb` and set 
              #       `Content-Type: text/html` header;
              #       turbo is happy.
              format.html { render(:new, status: :unprocessable_entity) }
            end
          end
    end

    def show
        @post = Post.find(params[:id])
    end


    private
        def post_params
        params.require(:post).permit(:title, :body)
    end

end
