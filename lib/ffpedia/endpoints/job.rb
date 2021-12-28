# frozen_string_literal: true

module Ffpedia
  # Job endpoints handler
  class Job < QueryBuilder
    def all
      data = filter_json("job", Character.new.all)
      "Here's your jobs list: #{data.join(", ")}"
    end
  end
end
