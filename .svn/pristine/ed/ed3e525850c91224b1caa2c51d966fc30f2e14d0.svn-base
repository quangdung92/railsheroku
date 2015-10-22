# This Class is Users of Api
#
# @author Koutarou Haramoto 
# @version 1.0
class Api::KindsController < AdminController

  # get a kinds list
  def index
    @kinds = Kind.getList(params[:page], params[:itemCount])
  end

end
