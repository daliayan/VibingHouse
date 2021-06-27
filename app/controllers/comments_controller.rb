class CommentsController < ApplicationController
    #before_action :require_login

    def index
    end

    def show
    end

    def new
        require_login
        @comment = Comment.new(house_id: params[:house_id])
        # if params[:house_id] && @house = House.find_by_id(params[:house_id])
        #     @comment = @house.comments.build
        # else
        #     @comment = Comment.new
        # end
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.house_id = params[:house_id]
        #current_user.comments.build(comment_params)
        if @comment.save
            redirect_to comment_path(@comment)
        else
            render :new
        end
    end

    def edit
    end

    def update
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :house_id)
    end

end