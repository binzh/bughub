class StatusesController < ApplicationController
  def conversion
    @bug=Bug.find(params[:bug_id])
    @status=Status.find(params[:id])
    if @status.previous_status_id==@bug.status.id
      if @bug.update_attribute(:status, @status)
        redirect_to bugs_path, :flash => {:notice => t('activerecord.models.bug')+t('model.successfully_updated')}
      else
        redirect_to :back, :flash => {:alert => @bug.errors.full_messages}
      end
    else
      redirect_to bugs_path, :flash => {:alert => t('activerecord.models.bug')+t('model.cannt_be_updated')}
    end
  end
end
