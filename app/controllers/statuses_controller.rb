class StatusesController < ApplicationController
  def conversion
    @bug=Bug.find(params[:bug_id])
    old_status=@bug.status.status_name
    @status=Status.find(params[:id])
    if @status.previous_status_id==@bug.status.id
      if @bug.update_attribute(:status, @status)
        @bug.bug_histories.create(:user => current_user, :bug_field => :status, :old_value => old_status, :new_value => @bug.status.status_name)
        redirect_to :back, :flash => {:notice => t('activerecord.models.bug')+t('model.successfully_updated')}
      else
        redirect_to :back, :flash => {:alert => @bug.errors.full_messages}
      end
    else
      redirect_to :back, :flash => {:alert => t('activerecord.models.bug')+t('model.cannt_be_updated')}
    end
  end
end
