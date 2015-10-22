class Comment < ActiveRecord::Base
  has_many :comment_histories
  has_many :viewers
  belongs_to :proceeding
  belongs_to :user

  validates :proceeding_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true


  class << self
    
    # this function is create comment and viewer
    # @params [Integer] proceeding_id proceeding id 
    # @params [Integer] user_id user id 
    # @params [String] content content
    # @return [Hash] a comment { {Model} }
    def create_comment(proceeding_id, user_id, content)
      #create comment
      comment = Comment.new(
        :proceeding_id => proceeding_id,
        :user_id => user_id,
        :content => content
      )
      comment.save

      #create comment history
      comment_history = CommentHistory.new(
       :comment_id => comment.id,
       :operation_user_id => user_id,
       :operation => CommentHistory.operations[:regist],
       :date => Time.now()
      )
      comment_history.save

      #create viewer
      users = User.get_users_of_proceeding_relation(proceeding_id)
      users = users.delete_if{|user| user[0] == user_id}
      logger.debug(users) 
      users.each do |user|
        viewer = Viewer.new(
          :comment_id => comment.id,
          :user_id => user[0],
          :is_confirmed => false 
        )
        viewer.save
      end

      comment
      
    end 

  end

end
