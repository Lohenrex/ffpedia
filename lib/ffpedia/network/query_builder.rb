# frozen_string_literal: true

require "json"

module Ffpedia
  # API request query builder
  class QueryBuilder
    def initialize
      @client = Ffpedia::Client.new("https://www.moogleapi.com/api/v1/")
    end

    def all
      # benchmark: 10s
      # client.get(endpoint_name)

      # benchmark using fibers: 10s
      # Since this API does not have pagination, there is no actual advantage using fibers or threads
      response = []
      f = Fiber.new { response = client.get(endpoint_name); Fiber.yield; }
      f.resume
      response
    end

    def find(id)
      client.get("#{endpoint_name}/#{id}")
    end

    def find_by(search_param, value)
      params = { search_param.to_s => value }
      client.get("#{endpoint_name}/search", query: params)
    end

    private

    attr_reader :client

    def endpoint_name
      @endpoint_name = "#{self.class.name.split("::")[-1].downcase}s"
    end

    def filter_json(filter, json)
      json.map { |char| char[:"#{filter}"] }.uniq.to_a.sort_by!(&:downcase)
    end
  end
end
