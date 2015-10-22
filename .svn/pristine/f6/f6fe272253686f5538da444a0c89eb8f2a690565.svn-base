# this class is Materials controller
# @author koutarou haramoto
# @version 1.0
class MaterialsController < ApplicationController
  before_action :set_material, only: [:download, :destroy]

  # file download
  def download
    filepath = Rails.root.join(@material.path, @material.file_name)
    filename = ERB::Util.url_encode(@material.file_name)
    stat = File::stat(filepath)
    send_file(filepath, filename: filename, length: stat.size, disposition: 'inline')
  end

  # file upload
  def upload

    proceeding_id = params[:proceeding_id]
    proceeding = Proceeding.find(proceeding_id)
    file = params[:file]
    save_path = %(public/data/#{proceeding.meeting_id})
    annotation = params[:annotation]

    # regist data to data base
    material = Material.new(
      :meeting_id => proceeding.meeting_id,
      :annotation => annotation,
      :path => save_path,
      :file_name => file.original_filename
    )
    material.save

    #upload file
    FileUtils.mkdir(save_path) unless FileTest.exist?(save_path)

    File.open(%(#{save_path}/#{file.original_filename}), "wb") {|f|f.write(file.read)}

    render :nothing => true
  end

  # file delete 
  def delete
    @material = Material.find(params[:params][:id])
    @material.deleteUploadFile
    @material.destroy
    render :nothing => true
  end

  # DELETE /materials/1
  def destroy

    begin
      Material.transaction do
        @material.deleteUploadFile
        @material.destroy
      end
    rescue => e
      create_ajax_response(1, e.message)
    else
      create_ajax_response(0)
    end

    render json: @ajax_response

  end

  private

    def set_material
      @material = Material.find(params[:id])
    end

end
