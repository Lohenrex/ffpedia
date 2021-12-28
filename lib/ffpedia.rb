# frozen_string_literal: true

require "json"
require_relative "ffpedia/version"
require_relative "ffpedia/network/client"
require_relative "ffpedia/network/query_builder"
require_relative "ffpedia/endpoints/character"
require_relative "ffpedia/endpoints/game"
require_relative "ffpedia/endpoints/job"
require_relative "ffpedia/endpoints/monster"
require_relative "ffpedia/endpoints/race"

module Ffpedia
  class Error < StandardError; end

  def self.characters
    Character.new.all
  end

  def self.characters_count
    Character.new.count
  end

  def self.character(id)
    Character.new.find(id)
  end

  def self.random_character
    Character.new.random
  end

  def self.characters_by_game(game)
    Character.new.find_by("origin", game)
  end

  def self.characters_by_name(character)
    Character.new.find_by("name", character)
  end

  def self.characters_by_race(race)
    Character.new.find_by("race", race)
  end

  def self.characters_by_job(job)
    Character.new.find_by("job", job)
  end

  def self.games
    Game.new.all
  end

  def self.game(id)
    Game.new.find(id)
  end

  def self.monsters
    Monster.new.all
  end

  def self.monster(id)
    Monster.new.find(id)
  end

  def self.monsters_by_name(monster)
    Monster.new.find_by("name", monster)
  end

  def self.jobs
    Job.new.all
  end

  def self.races
    Race.new.all
  end
end
