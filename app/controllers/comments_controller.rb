class CommentsController < ApplicationController
  def index
    @comments=Comment.all
  end
  def new
    @comment = Comment.new
  end
  def create
    @comment=Comment.new(comment_params)
    @comment.user_id=current_user.id
    @product=Product.find_by(id:params[:product_id].to_i)
    # debugger
    # puts current_product
    # @comment.product_id=session[:prod_id]
    respond_to do |format|
      if @comment.save
        format.turbo_stream { render turbo_stream: turbo_stream.replace('comment_form', partial: 'comments/form', locals: { comment:@product.comments.new() })}
        format.html { render partial: 'comments/form', locals: { comment:@product.comments.new() }}
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace('comment_form', partial: 'comments/form', locals: { comment: @comment }) }
        format.html { render partial: 'comments/form', locals: { comment: @comment }}
      end
    end
  end

  def show
    @comment=Comment.find_by(id:params[:id])
  end
  def update
  end

  def destroy
  end
  private
  def comment_params
    params.require(:comment).permit(:content,:product_id)
  end
end
