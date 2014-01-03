module Viner
  class Api

    def initialize(user_id = nil, key = nil)
      @user_id = user_id
      @key     = key
      Unirest.default_header('User-Agent','com.vine.iphone/1.0.3 (unknown, iPhone OS 6.0.1, iPhone, Scale/2.000000)')
      Unirest.default_header('Accept-Language','en, sv, fr, de, ja, nl, it, es, pt, pt-PT, da, fi, nb, ko, zh-Hans, zh-Hant, ru, pl, tr, uk, ar, hr, cs, el, he, ro, sk, th, id, ms, en-GB, ca, hu, vi, en-us;q=0.8')
    end

    def self.login(username, password)
      raise NotImplementedError
    end

  end
end
