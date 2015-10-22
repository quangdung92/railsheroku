# This Class is MaterialsController of Api
#
# @author Koutarou Haramoto
# @version 1.0
class Api::MaterialsController < ApplicationController

  # get materials of proceeding
  def get_materials_of_proceeding
    @materials = Material.get_materials_of_proceeding(params[:id]) 
  end

end
