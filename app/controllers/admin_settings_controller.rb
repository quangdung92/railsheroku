# This Class is Email Controller
# @author ThanhTV
# @version 1.0
class AdminSettingsController < AdminController

  layout 'admin'

  # index action
  def index

  end


  def change_status
    begin
      if !params.nil?
        _status = params[:status]
        obj = AdminSetting.find_by_id(1)
        obj.update_attribute :enable_cybozu, _status

        render :json => {:status => 'success'}
      else
        render :json => {:status => 'error'}
      end
    rescue => ex
      render :json => {:status => ex.message}
    end
  end

end
