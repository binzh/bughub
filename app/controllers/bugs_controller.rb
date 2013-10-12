class BugsController < ApplicationController
  def index
    @bugs=Bug.where('id like ? and summary like ?', "%#{params[:id]}%", "%#{params[:summary]}%").order('id desc')
    if not flash[:bugs].nil?
      @bugs=flash[:bugs]
      @condition=flash[:condition]
      @sql=flash[:sql]
    end
    @bug=Bug.new(flash[:bug])
    @user_fields=UserField.all
  end

  def create
    if simple_captcha_valid?
      @bug=Bug.new(params[:bug])
      @bug.status=Status.find(1)
      @bug.user=current_user
      if @bug.save
        @bug.create_bug_extra(:extra_fields => params[:uf])
        @bug.bug_histories.create(:user => current_user, :bug_field => :status, :new_value => @bug.status.status_name)
        redirect_to bugs_path, :flash => {:notice => t('activerecord.models.bug')+t('model.successfully_created')}
      else
        redirect_to :back, :flash => {:alert => @bug.errors.full_messages, :bug => params[:bug], :uf => params[:uf]}
      end
    else
      redirect_to :back, :flash => {:alert => t('simple_captcha.wrong'), :bug => params[:bug], :uf => params[:uf]}
    end
  end

  def query
    @bugs=Bug.order('id desc')
    params[:bug].each do |key, value|
      if not value.empty?
        key="date(#{key})" if key=='created_at' or key=='updated_at'
        @bugs=@bugs.where("#{key} like ?", "%#{value}%")
      end
    end
    redirect_to bugs_path, :flash => {:bugs => @bugs, :condition => params[:bug], :sql => @bugs.to_sql}
  end

  def show
    @bug=Bug.find(params[:id])
    @extra=Hash.new
    if @bug.bug_extra
      @bug.bug_extra.extra_fields.each do |key, value|
        @user_field =UserField.find(key)
        case @user_field.field_type_id
          when 1
            actual_value=User.find(value).username
          when 2
            actual_value=User.find(value).username
          when 5
            actual_value=EnumField.find(value).enum_text
          else
            actual_value=value
        end
        @extra[@user_field.field_name]=actual_value
      end
    end
  end
end
