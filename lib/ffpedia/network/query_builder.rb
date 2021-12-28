# frozen_string_literal: true
require 'json'

module Ffpedia
  # API request query builder
  class QueryBuilder
    def initialize
      @client = Ffpedia::Client.new("https://www.moogleapi.com/api/v1/")
    end

    def all
      client.get(endpoint_name)
    end

    def find(id)
      client.get("#{endpoint_name}/#{id}")
    end

    def find_by(search_param, value)
      params = { "#{ search_param }" => value }
      client.get("#{endpoint_name}/search", query: params)
    end

    private

    attr_reader :client

    def endpoint_name
      @endpoint_name = self.class.name.split("::")[-1].downcase + "s"
    end

    def filter_json(filter, json)
      json.map { |char| char[:"#{filter}"]}.uniq.to_a.sort_by! {|el| el.downcase }
    end
  end
end
