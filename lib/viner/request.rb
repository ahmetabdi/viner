module Viner
  module Request

    [:get, :post, :delete, :put, :patch].each{|verb|define_method(verb){|*arg| call(verb, arg[0], headers: arg[1], parameters: arg[2])}}

    def call(http_verb, url, opts={})
      result = connection(http_verb, url, opts)
      Hashie::Mash.new(result.body)
    end

    def connection(http_verb, url, opts={})
      opts.has_key?(:headers) ? nil : opts[:headers] = {}
      opts.has_key?(:parameters) ? nil : opts[:parameters] = nil
      Unirest.default_header('User-Agent','com.vine.iphone/1.0.3 (unknown, iPhone OS 6.0.1, iPhone, Scale/2.000000)')
      Unirest.default_header('Accept-Language','en, sv, fr, de, ja, nl, it, es, pt, pt-PT, da, fi, nb, ko, zh-Hans, zh-Hant, ru, pl, tr, uk, ar, hr, cs, el, he, ro, sk, th, id, ms, en-GB, ca, hu, vi, en-us;q=0.8')
      Unirest.default_header('vine-session-id', @key) if @key

      case http_verb
      when :get
        Unirest.get ENDPOINT+url, headers: opts[:headers], parameters: opts[:parameters]
      when :post
        Unirest.post ENDPOINT+url, headers: opts[:headers], parameters: opts[:parameters]
      when :delete
        Unirest.delete ENDPOINT+url, headers: opts[:headers], parameters: opts[:parameters]
      when :put
        Unirest.put ENDPOINT+url, headers: opts[:headers], parameters: opts[:parameters]
      when :patch
        Unirest.patch ENDPOINT+url, headers: opts[:headers], parameters: opts[:parameters]
      end
    end

  end
end