require 'active_support'
require 'active_support/core_ext'

module Viner
  module Request

    [:get, :post, :delete, :put, :patch].each{|verb|define_method(verb){|*arg| call(verb, arg[0], headers: arg[1], parameters: arg[2])}}

    def call(http_verb, url, opts={})
      result = connection(http_verb, url, opts)
      Hashie::Mash.new(JSON.parse(result.body))
    end

    def connection(http_verb, url, opts={})
      opts.has_key?(:headers) ? nil : opts[:headers] = {}
      opts.has_key?(:parameters) ? nil : opts[:parameters] = nil

      uri ||= URI::HTTPS.build host: ENDPOINT, path: url, query: opts[:parameters].to_param
      http_class = "Net::HTTP::#{http_verb.capitalize}".constantize
      http_request ||= http_class.new(uri.request_uri).tap do |request|
        request['User-Agent'] = 'com.vine.iphone/1.0.3 (unknown, iPhone OS 6.0.1, iPhone, Scale/2.000000)'
        request['Accept-Language'] = 'en, sv, fr, de, ja, nl, it, es, pt, pt-PT, da, fi, nb, ko, zh-Hans, zh-Hant, ru, pl, tr, uk, ar, hr, cs, el, he, ro, sk, th, id, ms, en-GB, ca, hu, vi, en-us;q=0.8'
        request['vine-session-id'] = @key if @key
      end

      Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
        http.request http_request
      end
    end
  end
end
