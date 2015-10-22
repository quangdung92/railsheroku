class User < ActiveRecord::Base
  has_many :action_item_histories
  has_many :action_items
  has_many :comment_histories
  has_many :comments
  has_many :meeting_histories
  has_many :observer_templates
  has_many :observers
  has_many :participantTemplates
  has_many :participants
  has_many :viewers

  has_secure_password 
  validates :login_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :grant, presence: true
  validates :kana,
    format: { with: /\A[\p{hiragana}ー[:blank:]]*\z/, message: I18n.t('validate.user.kana') }
  validates :mailaddress, email_format: { message: I18n.t('validate.user.email') }, allow_blank: true
  validates :password, presence: true, on: :create
  validates :password,
    format: { with: /\A([a-z0-9]{4,16})\z/i, message: I18n.t('validate.user.password') },
    allow_blank: true
  validates :cybozu_id,
    format: { with: /\A[0-9]*\z/i, message: I18n.t('validate.user.cybozu_id') }

  before_create :create_remember_token

  scope :is_enabled, -> { where(arel_table[:is_deleted].eq false) }

  # get_users_of_proceeding_relation
  # @params [Integer] proceeding_id proceeding id 
  # @return [Array] proceeding relation users {{user_id, user_name} ...}
  scope :get_users_of_proceeding_relation, -> (proceeding_id) do

    participant_table = Participant.arel_table
    observer_table = Observer.arel_table
    user_table = User.arel_table

    proceeding = Proceeding.find(proceeding_id)
    participant = Participant
      .where(participant_table[:meeting_id].eq(proceeding.meeting_id).and(user_table[:is_deleted].eq(false)))
      .joins(:user)
      .pluck(participant_table[:user_id].name, user_table[:name].name)
    observer = Observer
      .where(observer_table[:meeting_id].eq(proceeding.meeting_id).and(user_table[:is_deleted].eq(false)))
      .joins(:user)
      .pluck(observer_table[:user_id].name, user_table[:name].name)
    users = participant + observer
    users.uniq

  end

  DEFAULT_USER_PASSWORD = '1234'

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  def User.update_firstlogin(user, new_password)
    user[:is_firstlogged] = true
    user[:password_digest] = BCrypt::Password.create(new_password)
    user.save
  end

  def User.find_user(cookie_remember_token)
    remember_token = User.encrypt(cookie_remember_token)
    return User.find_by("remember_token = ?", remember_token)
  end

  class << self

    # import the user of cybozu
    #
    # @params [Array] cybozu_users CybozuApi::Model::User
    def import_user_of_cybozu(cybozu_users)

      cybozu_users.each do |user|
        params = {}
        params[:cybozu_id] = user.cybozu_id
        params[:login_id] = user.login_id
        params[:name] = user.name
        params[:kana] = user.kana
        params[:mailaddress] = user.mailaddress
        params[:grant] = 1
        params[:password] = DEFAULT_USER_PASSWORD
        create_with(params).find_or_create_by(cybozu_id: user.cybozu_id)
      end

    end

    # get the list of user
    #
    # @params [Integer] page_num current page
    # @params [Integer] item_count items pre 
    # @return [Hash] { count : ..., datas : [{Model}, {Model} ...] }
    def get_list(page_num, item_count)

      params = [];

      params.push({count: count})

      start_position = (page_num.to_i - 1) * item_count.to_i
      params.push({datas: offset(start_position).limit(item_count).to_a})

      params

    end

  end

  private
    def create_remember_token
      @remember_token = User.encrypt(User.new_remember_token)
    end

end
