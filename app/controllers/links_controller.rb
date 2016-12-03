class LinksController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :find_link, only: [:edit,:show]
  def new
  	@link = Link.new
  end

  def create
  	@link = Link.new(link_params)
  	if @link.save
  		flash[:notice] = 'The link have been saved'
  		redirect_to link_path(id: @link.id, it_was: 'created')
  	else
  		render :new
  	end
  end

  def show
    find_comments
    @comment = Comment.new
  	@action = params[:it_was]
  end

  def index
  	@links = Link.all	
  end

  private

  def link_params
  	params.require(:link).permit(:title,:description,:link)
  end

  def find_link
    @link = Link.find(params[:id])
  end
  
  def find_comments
    @comments = Comment.where(commentable_id: params[:id])
  end
end
