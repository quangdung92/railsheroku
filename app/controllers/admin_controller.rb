# This Class is Admin Controller
# @author Kudo Syuji
# @version 1.0
class AdminController < ApplicationController
  before_action :check_grant

  # index action
  def index

  end

  private

  # check grant of user.
  # if user is normal to move home.
  def check_grant

    # Function get config to send notification by Email or Cybozu
    # @author: ThanhTV
    # @Date: 2015/09/07
    @admin_setting = AdminSetting.take

    redirect_to "/home" unless current_user.grant.zero?

  end

end
