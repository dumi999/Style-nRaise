class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if user_signed_in?
      @listed_items = ListedItem.where.not(user: current_user)
    else
      @listed_items = ListedItem.all
    end
  end
end
