# frozen_string_literal: true

require "test_helper"

class FfpediaTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ffpedia::VERSION
  end

  def test_fetch_all_characters
    VCR.use_cassette("all_characters") do
      characters = Ffpedia.characters
      assert_instance_of Array, characters
      assert_instance_of Hash, characters.first
    end
  end

  def test_character_exists
    VCR.use_cassette("character") do
      character = Ffpedia.character("66000ff6-e1ab-40a8-0fdc-08d6afcab3e2")
      assert_equal "66000ff6-e1ab-40a8-0fdc-08d6afcab3e2", character.first.fetch(:id)
    end
  end

  def test_can_get_random_character
    VCR.use_cassette("random_character") do
      character = Ffpedia.random_character
      assert_instance_of Hash, character
    end
  end

  def test_filter_characters_by_game
    VCR.use_cassette("ff7_game_characters") do
      ff7_game_characters = Ffpedia.characters_by_game("Final Fantasy VII")
      assert_instance_of Array, ff7_game_characters
      assert_instance_of Hash, ff7_game_characters.first
      assert_equal "Final Fantasy VII", ff7_game_characters.first.fetch(:origin)
    end
  end

  def test_filter_characters_by_name
    VCR.use_cassette("cloud_named_characters") do
      cloud_named_characters = Ffpedia.characters_by_name("Cloud")
      assert_instance_of Array, cloud_named_characters
      assert_instance_of Hash, cloud_named_characters.first
    end
  end

  def test_filter_characters_by_race
    VCR.use_cassette("viera_race_characters") do
      viera_race_characters = Ffpedia.characters_by_race("Viera")
      assert_instance_of Array, viera_race_characters
      assert_instance_of Hash, viera_race_characters.first
      assert_equal "Viera", viera_race_characters.first.fetch(:race)
    end
  end

  def test_filter_characters_by_job
    VCR.use_cassette("lcie_job_characters") do
      lcie_job_characters = Ffpedia.characters_by_job("l'Cie")
      assert_instance_of Array, lcie_job_characters
      assert_instance_of Hash, lcie_job_characters.first
      assert_equal "l'Cie", lcie_job_characters.first.fetch(:job)
    end
  end

  def test_fetch_all_games
    VCR.use_cassette("all_games") do
      games = Ffpedia.games
      assert_instance_of Array, games
      assert_instance_of Hash, games.first
    end
  end

  def test_game_exists
    VCR.use_cassette("game") do
      game = Ffpedia.game("9fc1c377-95f1-4a09-399f-08d6b0a627a3")
      assert_equal "9fc1c377-95f1-4a09-399f-08d6b0a627a3", game.first.fetch(:gameId)
      assert_instance_of Hash, game.first
    end
  end

  def test_fetch_all_monsters
    VCR.use_cassette("all_monsters") do
      monsters = Ffpedia.monsters
      assert_instance_of Array, monsters
      assert_instance_of Hash, monsters.first
    end
  end

  def test_monster_exists
    VCR.use_cassette("monster") do
      monster = Ffpedia.monster("d507b107-2030-4b43-edc0-08d7131b9cd4")
      assert_equal "d507b107-2030-4b43-edc0-08d7131b9cd4", monster.first.fetch(:monsterId)
      assert_instance_of Hash, monster.first
    end
  end

  def test_filter_monsters_by_name
    VCR.use_cassette("chocobo_monster") do
      chocobo = Ffpedia.monsters_by_name("chocobo")
      assert_instance_of Array, chocobo
      assert_instance_of Hash, chocobo.first
    end
  end

  def test_fetch_all_jobs
    VCR.use_cassette("all_jobs") do
      jobs = Ffpedia.jobs
      assert_instance_of Array, jobs
    end
  end

  def test_fetch_all_races
    VCR.use_cassette("all_races") do
      races = Ffpedia.races
      assert_instance_of Array, races
    end
  end
end
