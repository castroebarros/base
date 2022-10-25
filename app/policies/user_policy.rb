class UserPolicy < ApplicationPolicy
  def edit?
    user.admin?
  end

  def confirm?
    user.admin?
  end

  def invite?
    user.admin?
  end

  def login_as?
    user.admin?
  end
end
