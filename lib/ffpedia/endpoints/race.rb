# frozen_string_literal: true

module Ffpedia
  # Race endpoints handler
  class Race < QueryBuilder
    def all
      data = filter_json("race", Character.new.all)
      "Here's your races list: #{data.join(", ")}"
    end
  end
end
