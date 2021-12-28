# frozen_string_literal: true

module Ffpedia
  # Character endpoints handler
  class Character < QueryBuilder
    def random
      client.get("#{endpoint_name}/random")
    end

    def count
      client.get("#{endpoint_name}/count")
    end
  end
end
