class CommentsController < ApplicationController
  def create
    params[:comment][:comment]=params[:comment][:comment].gsub(/\r/, '<br/>')
    (params[:comment][:comment]).scan(/@\S*\s/).each do |user|
      username=user.chop.delete("@")
      user=User.where(:username => username).first
      user.notifications.create(:model_name => params[:comment][:model_name], :model_id => params[:comment][:model_id], :content => params[:comment][:comment])
    end
    @comment=Comment.new(params[:comment])
    if @comment.save
      redirect_to :back, :flash => {:notice => t('activerecord.models.comment')+t('model.successfully_created')}
    else
      redirect_to :back, :flash => {:alert => @comment.errors.full_messages, :bug => params[:comment]}
    end
  end
end
