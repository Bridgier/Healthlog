class PeopleController < ApplicationController
  def list
  end

  def view
  	@user = User.find(1)
  end

  def new
  end

  def edit
  end

end
