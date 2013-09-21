class User < ActiveRecord::Base
  def self.test(access_token = 1704836067)

    user = FbGraph::User.fetch(1704836067)

    puts "user details are >afkdsajdfkjdaskjkldafs"
    puts user.raw_attributes

    puts "eeeeeeeeeeeeeeeeeeee"

  end

  def self.fb_create(access_token)
    begin
      user = FbGraph::User.fetch(access_token)
      params = user.raw_attributes
      User.create(:access_token => params["id"], :first_name => params["first_name"],  :last_name => params["last_name"], :link => params["link"], :username => params["username"], :gender => params["gender"], :locale => params["locale"]  )
    rescue => e
    end
  end

end
