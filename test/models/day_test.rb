require 'test_helper'

class DayTest < ActiveSupport::TestCase
  setup do
    @day = days(:aachen_open_day_one)
  end

  test "validates presence of competition" do
    @day.competition = nil
    assert_not_valid(@day, :competition)

    @day.competition_id = 1234
    assert_not_valid(@day, :competition)
  end

  test "validates presence of date" do
    @day.date = nil
    assert_not_valid(@day, :date)
  end

  test "validates uniqueness of date, but only scoped to competition" do
    another_day = @day.dup
    assert_not_valid(another_day, :date)

    another_day.competition = competitions(:german_open)
    assert_valid another_day
  end
end