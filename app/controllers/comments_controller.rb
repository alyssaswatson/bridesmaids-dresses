require 'byebug'

class CommentsController < ApplicationController
    
    def index
		@dress = Dress.find(params[:dress_id])
        @comments = @dress.comments.all
        render json: @comments
    end
    
    def create 
        @dress = Dress.find(params[:dress_id])
        @comment = @dress.comments.new(comment_params)
        if @comment.save
            byebug
            respond_to do |format|
              format.js
            end
          else
            console.log("hallo")
          end
    end

    def show
        #byebug
		@comment= Comment.find(params[:id])
	end
	

private

    def comment_params
		params.require(:comment).permit(:dress_id, :comment)
	end


end
