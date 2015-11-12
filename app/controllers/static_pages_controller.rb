class StaticPagesController < ApplicationController

  def home
#2015/11/12 change
    if signed_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
#2015/11/12 change END
  end

  def help
  end

  def about
  end

  def contact
  end

end
