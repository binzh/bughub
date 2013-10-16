class CommentsController < ApplicationController
  def create
    params[:comment][:comment]=params[:comment][:comment].gsub(/\r/, '<br/>')
    @comment=Comment.new(params[:comment])
    if @comment.save
      redirect_to :back, :flash => {:notice => t('activerecord.models.comment')+t('model.successfully_created')}
    else
      redirect_to :back, :flash => {:alert => @comment.errors.full_messages, :bug => params[:comment]}
    end
  end
end
