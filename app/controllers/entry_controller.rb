class EntryController < ApplicationController
  def new

    if param_posted?(:entry) #request.post? and params[:user]
      
      @user = User.find_by_id(session[:user_id])
      @user.entries << Entry.new(params[:entry])

      if(@user.save)
        redirect_to :action => "index", :controller => "users"
      end
    end    

  end

  def delete
  end

  def view

#    @context_links = [['Yesterday', 'view', 'entry', Date.yesterday.to_s(:db)],
#                      ['Tomorrow', 'view', 'entry', 'tomorrow']]

    @user = User.find_by_id(session[:user_id])
    @logentries = Entry.fetchLogList(session[:user_id])
    
    if params[:id] == nil then
      entry_date = Date.today.to_s(:db)
    else
      entry_date = params[:id]
    end

    if param_posted?(:entry)
 
      if(@entry = Entry.find_by_user_id_and_entry_date(session[:user_id], entry_date)) then
        @entry.attributes = params[:entry];
        @entry.save;        
      else
        @entry = Entry.new(params[:entry])
        @user.entries << @entry
        @user.save        
      end
    else
      @entry = Entry.find_by_user_id_and_entry_date(session[:user_id], entry_date) || 
               Entry.new(:entry_date => entry_date)
    end

  end

  def entry_attribute

   if (request.xhr?)

     @entry = Entry.find_by_user_id_and_entry_date(session[:user_id], params[:entry_date]) || 
              Entry.new(:entry_date => params[:entry_date], :user_id => session[:user_id])

     @entry[params[:id]]= params[:value];
     
     @entry.save;

   end

     render :text => params[:value]

  end


end
