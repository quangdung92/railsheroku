module MeetingsSearch

  # create a search condition of meeting
  #
  # @params [ActiveRecord::Relation] relation relation object.
  # @params [Hash] options
  # { freeWord, likename, fromDate, toDate, kind, is_holding, is_completed }
  # @return [ActiveRecord::Relation]
  def create_search_condition(relation, options)

    unless options[:freeWord].blank?
      relation = relation
        .where("CONCAT('【', kinds.name, '】', meetings.name) like ?",
          "%#{options[:freeWord]}%"
        )
    end

    unless options[:likeName].blank?
      relation = relation.merge(Meeting.find_like_name(%(%#{options[:likeName]}%)))
    end

    unless options[:date].blank?
      relation = relation.merge(Meeting.eq_dates(options[:date]))
    end

    unless options[:fromDate].blank?
      relation = relation.merge(Meeting.gteq_dates(options[:fromDate]))
    end

    unless options[:toDate].blank?
      relation = relation.merge(Meeting.lteq_dates(options[:toDate]))
    end

    unless options[:kind].blank?
      relation = relation.merge(Meeting.eq_kind(options[:kind]))
    end
  
    unless options[:is_holding].blank?
      relation = relation.merge(Meeting.is_holding(options[:is_holding]))
    end
 
    unless options[:is_completed].blank?
      relation = relation.merge(Meeting.is_completed(options[:is_completed]))
    end

    relation.order(created_at: :desc)

  end

end
