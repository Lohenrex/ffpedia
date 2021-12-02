# frozen_string_literal: true

require_relative "ffpedia/version"
require_relative "ffpedia/client"

module Ffpedia
  class Error < StandardError; end
  client = Client.new
  # p client.get_random_character
  # p client.get_jobs
  # p client.get_races
  p client.get_origins
  # p client.search_character("name", "cloud")
  # p client.delete_character_by("name", "lightning")
end


# binding.irb
