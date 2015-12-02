class StaticPagesController < ApplicationController
  def spage1
    @item1 = current_user.items.first if logged_in? #First item of logged in user
  end

  def spage2
    @item = current_user.items.build if logged_in? #Build single entry from webform
  end
end
