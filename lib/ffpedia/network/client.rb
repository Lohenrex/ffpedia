require "net/http"
require "json"

module Ffpedia
  class Client
    attr_reader :base_url

    def initialize(base_url)
      @base_url = base_url
    end

    def get(path, **args)
      # implementation for the http get request
      uri = build_uri(path, **args)
      res = Net::HTTP.get_response(uri)
      serialize(res.body) if res.is_a?(Net::HTTPSuccess)
    end

    def post(path, **args)
      # implementation for the http post request
      uri = build_uri(path, **args)
      req = Net::HTTP::Post.new(uri)
      res = Net::HTTP.start(uri.hostname, uri.port) { |http| http.request(req) }
      serialize(res.body) if res.is_a?(Net::HTTPSuccess)
    end

    def put(path, **args)
      # implementation for the http put request
      uri = build_uri(path, **args)
      req = Net::HTTP::Put.new(uri)
      res = Net::HTTP.start(uri.hostname, uri.port) { |http| http.request(req) }
      serialize(res.body) if res.is_a?(Net::HTTPSuccess)
    end

    def delete(path, **args)
      # implementation for the http delete request
      uri = build_uri(path, **args)
      req = Net::HTTP::Delete.new(uri)
      res = Net::HTTP.start(uri.hostname, uri.port) { |http| http.request(req) }
      serialize(res.body) if res.is_a?(Net::HTTPSuccess)
    end

    private

    def serialize(content)
      JSON.parse(content, symbolize_names: true)
    rescue JSON::ParserError
      nil
    end

    def build_uri(path, **params)
      uri = URI.join(base_url, path)
      uri.query = query_items(**params)
      uri
    end

    def query_items(**options)
      query_items = options.fetch(:query, {}).compact
      URI.encode_www_form(query_items)
    end
  end
end
