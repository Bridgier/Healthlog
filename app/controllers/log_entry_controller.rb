class LogEntryController < ApplicationController
  def list
	@user = User.find(2)
  end

  def update
  end

  def delete
  end

end
