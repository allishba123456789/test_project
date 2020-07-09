class UsagePolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @model = model
  end

  def index?
    current_user.present?
  end

  def create?
    current_user.present? && !@current_user.admin?
  end

  def new?
    current_user.present? && !@current_user.admin?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else
        scope.joins(subscription: :user).where('users.email'=> user.email)
      end
    end
  end
 end