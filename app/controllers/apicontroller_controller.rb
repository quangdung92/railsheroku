class ApicontrollerController < ApplicationController
  # def hanlder
  #   @sel = params[:sel]
  #   page = params[:page].present? ? params[:page] : 1
  #   if @sel == "Users"
  #     @data = User.all.paginate(:page => page, :per_page => 1 )
  #   elsif @sel == "Kinds"
  #     @data = Kind.all.paginate(:page => page, :per_page => 1 )
  #   else
  #     @data = Meeting.all.paginate(:page => page, :per_page => 1 )
  #   end
  #   render json: {:data => @data, :total_pages => @data.total_pages}
  # end
  def index
    @data = "You can rung with API"
    render json: {:data => @data}
  end
end
