# this class is WhatsNewLists controller
# @author koutarou haramoto
# @version 1.0
class WhatsNewListsController < ApplicationController
  before_action :set_kind
  before_action :set_history_kind

  def index
  end

  private

    def set_kind
      @kinds = Kind.create_select_options
    end

    def set_history_kind
      @history_kinds = t('views.whats_new_lists.select.history_kind')
    end
end
