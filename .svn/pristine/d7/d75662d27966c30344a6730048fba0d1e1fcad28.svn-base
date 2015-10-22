# This Module is MaterialsHelper of Api
#
# @author Koutarou Haramoto 
# @version 1.0
module Api::MaterialsHelper

  # create a list of materials
  # @return [Array] material list. [{ id:..., meeting_id:..., annotation:..., path:..., file_name:..., url:... }]
  def create_list_of_materials_of_proceeding

    list = []

    unless @materials.empty?
      @materials.each do |material|
        list.push({
          id: material.id,
          meeting_id: material.meeting_id,
          annotation: material.annotation,
          path: material.path,
          file_name: material.file_name,
          url: "/materials/#{material.id}/download",
        })
      end
    end

    list

  end

end
