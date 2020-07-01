class ArticlePolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == chantier.user
  end

  def destroy?
    return true if user.present? && user == chantier.user
  end

  private

    def article
      record
    end
end
