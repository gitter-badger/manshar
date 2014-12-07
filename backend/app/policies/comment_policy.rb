class CommentPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end

  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def create?
    super || true
  end

  def index?
    super || true
  end

  def show?
    false
  end

  def update?
    super || owned?
  end

  def destroy?
    super || owned?
  end


  private
  def owned?
    comment.user_id == user.id if user
  end

end
