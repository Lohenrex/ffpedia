# frozen_string_literal: true

module Ffpedia
  # Race endpoints handler
  class Race < QueryBuilder
    def all
      filter_json("race", Character.new.all)
    end
  end
end
