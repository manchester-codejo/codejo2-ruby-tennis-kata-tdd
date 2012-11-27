require 'test/unit'

class TestTennisKata < Test::Unit::TestCase
	def test_that_initial_score_is_0_0
		tennis_game = TennisGame.new
		assert_equal([0, 0], tennis_game.score)
	end
	def test_player_1_scored
		tennis_game = TennisGame.new
		tennis_game.player_one_scored
		assert_equal([15, 0], tennis_game.score)
	end

	def test_player_two_scored
		tennis_game = TennisGame.new
		tennis_game.player_two_scored
		assert_equal([0, 15], tennis_game.score)
	end

	def test_player_one_scores_twice
		tennis_game=TennisGame.new
		tennis_game.player_one_scored
		tennis_game.player_one_scored
		assert_equal([30,0],tennis_game.score)
	end

	def test_given_that_player_one_scores_three_times_score_is_40_0
		tennis_game = TennisGame.new
		tennis_game.player_one_scored
		tennis_game.player_one_scored
		tennis_game.player_one_scored
		assert_equal([40,0], tennis_game.score)
	end
end

class TennisGame
		POINT_SEQUENCE = [0,15,30,40]

	def initialize
		@score = [0, 0]
		@player_one_points = 0
	end

	def player_one_scored
		@player_one_points +=1
		@score[0] = POINT_SEQUENCE[@player_one_points]
	end

	def player_two_scored
		@score[1] =	POINT_SEQUENCE[1]
	end

	def score
		@score
	end
end