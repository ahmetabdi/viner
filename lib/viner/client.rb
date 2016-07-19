module Viner
  class Client
    include Request

    attr_accessor :user_id, :key

    def initialize
      @user_id = nil
      @key     = nil
    end

    # Login
    def login(username, password)
      # POST https://api.vineapp.com/users/authenticate
      result = post('users/authenticate', {}, { username: username, password: password })
      self.user_id = result['data']['userId']
      self.key     = result['data']['key']
      result
    end

    # Logout
    def logout
      # DELETE https://api.vineapp.com/users/authenticate
      delete('users/authenticate', {}, {})
    end

    # Get Popular
    def popular
      # GET https://api.vineapp.com/timelines/popular
      get('timelines/popular', {}, {})
    end

    def search(username)
      # GET https://api.vineapp.com/users/search/<username>
      get("users/search/#{username}", {}, {}).data.records
    end

    # Get Tag
    def tag(tag)
      # GET https://api.vineapp.com/timelines/tags/<tag>
      get("timelines/tags/#{tag}", {}, {})
    end

    # Get User Data
    def profile(user = nil)
      if user
        # GET https://api.vineapp.com/users/profiles/<userid>
        get("users/profiles/#{user}", {}, {})
      else
        # GET https://api.vineapp.com/users/me
        get("users/me", {}, {})
      end
    end

    def timeline(user_id)
      # GET https://api.vineapp.com/timelines/users/<userid>
      result = get("timelines/users/#{user_id}", {}, {})
      return result.data.records if result.success
    end

    # Get Single Post
    def posts(post)
      # GET https://api.vineapp.com/timelines/posts/<postid>
      get("timelines/posts/#{post}", {}, {})
    end

    # Get Notifications
    def notifications
      # GET https://api.vineapp.com/users/<userid>/pendingNotificationsCount
      get("users/#{@user_id}/pendingNotificationsCount", {}, {})
    end

  end
end
