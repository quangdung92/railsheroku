module ActionItemsSearch

  # create a search condition of action items.
  #
  # @params [ActiveRecord::Relation] relation relation object.
  # @params [Hash] options { content, aiFormDate, aiToDate }
  # @return [ActiveRecord::Relation]
  def create_search_condition_of_ai(relation, options)

    unless options[:content].blank?
      relation = relation.merge(ActionItem.like_content(%(%#{options[:content]}%)))
    end

    unless options[:aiFromDate].blank?
      relation = relation.merge(ActionItem.gteq_scheduled_date(options[:aiFromDate]))
    end

    unless options[:aiToDate].blank?
      relation = relation.merge(ActionItem.lteq_scheduled_date(options[:aiToDate]))
    end

    relation.order(created_at: :desc)

  end

end
