class PagesController < ApplicationController

  layout :choose_layout

  def privacy_policy
  end

  def terms_of_service
  end

  private

  def choose_layout
    current_user.present? ? 'with_user' : 'without_user'
  end
end