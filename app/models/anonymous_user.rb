# frozen_string_literal: true

class AnonymousUser
  def signed_in?
    false
  end

  def admin?
    false
  end
end
