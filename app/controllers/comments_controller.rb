class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)
	    @comment.user_id = current_user.id
	    if @comment.save
	      flash[:notice] = 'The comment have been saved'
	      redirect_to post_path(id: @comment.commentable_id,type: @comment.commentable_type, it_was: 'created')
	    else
	      redirect_to post_path(id: @comment.commentable_id,type: @comment.commentable_type,  it_was: 'created')
	    end
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	private

	def find_commentable
		params.each do |name, value|
			if name =~ /(.+)_id$/
				return $l.classify.constantize.find(value)
			end
		end
		nil
	end

	def comment_params
    	params.require(:comment).permit(:commentable_id,:commentable_type,:content)
  	end
end

