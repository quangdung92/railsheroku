# this class is Accounts helper 
# @author koutarou haramoto
# @version 1.0
module AccountsHelper

  # create a header title
  # @return [String] header title
  def create_header_title

    case controller.action_name
    when 'index' then
      t("views.accounts.index.title")
    when 'edit', 'update' then
      t("views.accounts.edit.title")
    end
    
  end

end
