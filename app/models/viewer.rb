class Viewer < ActiveRecord::Base
  belongs_to :comment
  belongs_to :user

  validates :comment_id, presence: true
  validates :user_id, presence: true

  class << self

    # this function is confirm comment
    # @params [Integer] comment_id comment id
    # @params [Integer] user_id user_id
    def confirm_comment(comment_id, user_id)
      viewer = Viewer.where(
        :comment_id => comment_id,
        :user_id => user_id
      )
      viewer.update_all(:is_confirmed => true)
      viewer
    end

  end

end
