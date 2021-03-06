class User < ActiveRecord::Base
  
  attr_accessor :remember_me
  
  has_many :entries
  validates_uniqueness_of :screen_name, :email
  validates_length_of :screen_name, :within => 4..20
  validates_length_of :password, :within => 4..20
  validates_presence_of :email

def clear_password!
   self.password = nil
end

def login!(session)
  session[:user_id] = id
end

def remember!(cookies)
  cookies[:remember_me] = { 
    :value => "1",
    :expires => 10.years.from_now}

  self.authorization_token = Digest::SHA1.hexdigest("#{self.screen_name}:#{self.password}")

  self.save!

  cookies[:authorization_token] = {
    :value => self.authorization_token,
    :expires => 10.years.from_now}

end

def forget!(cookies)

  cookies.delete(:remember_me)
  cookies.delete(:authorization_token)

end

def remember_me?
  remember_me == "1"
end
                                                  
end
