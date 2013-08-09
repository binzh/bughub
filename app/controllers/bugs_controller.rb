class BugsController < ApplicationController
  def index
    @bugs = Bug.all
    @bug = Bug.new
  end

  def create
    if simple_captcha_valid?
      @bug = Bug.new(params[:bug])
      @bug.user = current_user
      if @bug.save
        redirect_to bugs_path, :flash => {:notice => t('activerecord.models.bug')+t('model.successfully_created')}
      else
        redirect_to :back, :flash => {:alert => @bug.errors.full_messages}
      end
    else
      redirect_to :back, :flash => {:alert => t('simple_captcha.wrong')}
    end
  end

end
