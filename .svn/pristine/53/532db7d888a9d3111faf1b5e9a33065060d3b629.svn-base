# controller is unresolved action item list controller
# @author Kudo Syuji
# @version 1.0
class UnresolvedAiListsController < ApplicationController

  # POST /unresolved_ai_lists/me
  def me
    set_kind
  end

  # POST /unresolved_ai_lists/meeting
  def meeting
    set_kind
  end

  private

    def set_kind
      @kinds = Kind.create_select_options
    end

end
