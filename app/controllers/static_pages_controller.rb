class StaticPagesController < ApplicationController
  def spage1
    @item = current_user.items.build if logged_in?
  end

  def spage2
  end
end
