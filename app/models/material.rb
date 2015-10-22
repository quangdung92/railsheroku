class Material < ActiveRecord::Base
  belongs_to :meeting

  validates :meeting_id, presence: true
  validates :annotation, presence: true
  validates :path, presence: true
  validates :path, uniqueness: {
    message: I18n.t('views.materials.message.files_that_exist'),
    scope: [:file_name]
  }
  validates :file_name, presence: true

  # delete a upload file
  def deleteUploadFile

    filepath = Rails.root.join(path, file_name)

    if File.exist? filepath 
      File.delete filepath
    end

  end

  class << self

    # get materials of proceeding
    # @params [Integer] proceeding_id proceeding_id
    # @return [Array] {[{Model},{Model} ...]}
    def get_materials_of_proceeding(proceeding_id)
      Material.eager_load(:meeting => :proceeding).where(["proceedings.id = ?", proceeding_id])
    end

    # file upload
    #
    # @param [Array] file information
    # @param [Integer] meeting id
    # @return [Array] [{path, file_name, annotation}..]
    def upload(files, meeting_id)

      materials = []

      unless files.blank?
        files.each do |material|
          file = material[1][:file]
          save_path = %(public/data/#{meeting_id})

          FileUtils.mkdir(save_path) unless FileTest.exist?(save_path)

          File.open(%(#{save_path}/#{file.original_filename}), "wb") {|f|f.write(file.read)}

          materials.push({ path: save_path, file_name: file.original_filename, annotation: material[1][:annotation] })
        end
      end

      materials

    end
  end

end
