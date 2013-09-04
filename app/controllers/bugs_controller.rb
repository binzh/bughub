class BugsController < ApplicationController
  def index
    @bugs=Bug.where('id like ? and summary like ?', "%#{params[:id]}%", "%#{params[:summary]}%")
    if not flash[:bugs].nil?
      @bugs=flash[:bugs]
      @condition=flash[:condition]
      @sql=flash[:sql]
    end
    @bug=Bug.new
  end

  def create
    if simple_captcha_valid?
      @bug=Bug.new(params[:bug])
      @bug.status=Status.find(1)
      @bug.user=current_user
      if @bug.save
        redirect_to bugs_path, :flash => {:notice => t('activerecord.models.bug')+t('model.successfully_created')}
      else
        redirect_to :back, :flash => {:alert => @bug.errors.full_messages}
      end
    else
      redirect_to :back, :flash => {:alert => t('simple_captcha.wrong')}
    end
  end

  def query
    @bugs=Bug.where('summary like ?', "%#{params[:bug][:summary]}%")
    params[:bug].each do |key, value|
      if value!=''
        key="date(#{key})" if key=='created_at' or key=='updated_at'
        @bugs=@bugs.where("#{key}=?", value)
      end
    end
    redirect_to bugs_path, :flash => {:bugs => @bugs, :condition => params[:bug], :sql => @bugs.to_sql}
  end
end
