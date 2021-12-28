# frozen_string_literal: true

require "net/http"
require "json"

class Client
  attr_reader :base_url

  def initialize
    @base_url = "https://www.moogleapi.com"
  end

  def search_character_post(param, value)
    # implementation for the http post request
    path = "api/v1/characters/search"
    uri = URI("#{base_url}/#{path}")
    params = { param.to_s => value }
    res = Net::HTTP.post_form(uri, params)

    spotless_json(res.body) if res.is_a?(Net::HTTPSuccess)
  end

  def search_character(search_param, value)
    # implementation for the http post request
    path = "api/v1/characters/search"
    uri = URI("#{base_url}/#{path}")
    params = { search_param.to_s => value }
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)

    spotless_json(res.body) if res.is_a?(Net::HTTPSuccess)
  end

  def get_random_character
    # implementation for the http get request
    path = "api/v1/characters/random"
    uri = URI("#{base_url}/#{path}")
    res = Net::HTTP.get_response(uri)

    spotless_json(res.body) if res.is_a?(Net::HTTPSuccess)
  end

  def get_every_character_data
    # implementation for the http get request
    path = "/api/v1/characters"
    uri = URI("#{base_url}/#{path}")
    res = Net::HTTP.get_response(uri)

    spotless_json(res.body) if res.is_a?(Net::HTTPSuccess)
  end

  def get_jobs
    data = filter_json("job", get_every_character_data)
    "Here's your jobs list: #{data.join(", ")}"
  end

  def get_races
    data = filter_json("race", get_every_character_data)
    "Here's your races list:  #{data.join(", ")}"
  end

  def get_origins
    data = filter_json("origin", get_every_character_data)
    "Here's your origins list:  #{data.join(", ")}"
  end

  def update_character(id, updated_char)
    # implementation for the http put request
    uri = URI("#{base_url}/api/v1/characters/update")
    params = { "id" => id, "updated_char" => updated_char }
    req = Net::HTTP::Put.new(uri)
    req.set_form_data(params)

    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    case res
    when Net::HTTPSuccess
      "Character succesfully updated!"
    else
      res.value
    end
  end

  def delete_character(id)
    # implementation for the http delete request
    uri = URI("#{base_url}/api/v1/characters/delete")
    params = { "id" => id }
    req = Net::HTTP::Delete.new(uri)
    req.set_form_data(params)

    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    case res
    when Net::HTTPSuccess
      "Character succesfully deleted!"
    else
      res.value
    end
  end

  def delete_character_by(param, value)
    selected_char = search_character(param, value)
    if selected_char.length > 1
      chars_list = selected_char.map { |x| x[:name] + "(#{x[:origin]})" }.join(", ")
      "Which one do you want to delete? #{chars_list}"
    else
      delete_character(selected_char.first[:id])
    end
  end

  private

  def spotless_json(content)
    JSON.parse(content, symbolize_names: true)
  rescue JSON::ParserError
    nil
  end

  def filter_json(filter, json)
    json.map { |char| char[:"#{filter}"] }.uniq.to_a.sort_by!(&:downcase)
  end
end
