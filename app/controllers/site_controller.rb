class SiteController < ApplicationController

  TITLE = "Bridgier's Awesome Health Log"

  def index

    if(logged_in?)
      redirect_to :action => "view", :controller => "entry"
    else
      @title = TITLE
    end
  end

  def about
      @title = 'About ' + TITLE
  end

  def help
      @title = 'Help for ' + TITLE
  end

end
