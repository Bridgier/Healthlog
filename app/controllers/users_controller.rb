class UsersController < ApplicationController

  before_filter :protect, :except => [:login, :new]


  def index


    @context_links = [['New', 'new', 'entry']]
    @user = User.find_by_id(session[:user_id])
    @logentries = Entry.fetchLogList(session[:user_id])

  end

  def view

  end

  def new
    @title = "Create"

    if param_posted?(:user) #request.post? and params[:user]
      @user = User.new(params[:user])
      if @user.save
        session[:user_id] = @user.id
        session[:screen_name] = @user.screen_name
        flash[:notice] = "User #{@user.screen_name} created!"
        redirect_to :action => "index"
      end
    end    
  end
  
  def edit
  end
  

  def login

      @title = "Log in to Health Log"
     
      if request.get?
        @user = User.new(:remember_me => remember_me_string)
      elsif param_posted?(:user)
      	 @user = User.new(params[:user])
	 user = User.find_by_screen_name_and_password(@user.screen_name,
						      @user.password)
         if user
	   user.login!(session)
           @user.remember_me ? user.remember!(cookies) : user.forget!(cookies)
	   redirect_to_forwarding_url
	 else
           @user.clear_password!
           flash[:notice] = "Invalid credentials"
         end
     end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged Out"
    cookies.delete(:authorization_token);
    redirect_to :action => 'index', :controller => 'site'
  end
    
private

def param_posted?(symbol)
 request.post? and params[symbol]
end

def redirect_to_forwarding_url
  if(redirect_url = session[:protected_page])
     session[:protected_page] = nil
     redirect_to redirect_url
  else
    redirect_to :action => "index"
  end
end

def protect

  unless logged_in?
    session[:protected_page] = request.request_uri
    flash[:notice] = "Please log in first"
    redirect_to :action => "login"
    return false
  end
end

def remember_me_string
  cookies[:remember_me] || "0"
end

end
