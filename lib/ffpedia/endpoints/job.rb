# frozen_string_literal: true

module Ffpedia
  # Job endpoints handler
  class Job < QueryBuilder
    def all
      filter_json("job", Character.new.all)
    end
  end
end
