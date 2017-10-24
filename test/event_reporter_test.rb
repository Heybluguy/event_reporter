require "minitest/autorun"
require "minitest/pride"
require "./lib/event_reporter"

class ReporterTest < Minitest::Test
  def test_queue_starts_empty
    reporter = Reporter.new

    assert_equal 0, reporter.queue.count
  end

  # def test_queue_has_a_count
  #   reporter = Reporter.new
  #   reporter.load_file("./data/attendee_fixture.csv")
  #
  #   assert_equal 10, reporter.queue.count
  # end

  def test_it_can_find_a_firstname
    reporter = Reporter.new
    reporter.load_file("./data/attendee_fixture.csv")

    reporter.find_first_names("Sarah")
    assert_equal 2, reporter.queue.count
  end

  def test_queue_returns_empty_when_no_match_found
    reporter = Reporter.new
    reporter.load_file("./data/attendee_fixture.csv")

    assert_equal [], reporter.find_first_names("John")
  end

  def test_it_clears_queue
    reporter = Reporter.new
    reporter.load_file("./data/attendee_fixture.csv")
    reporter.find_first_names("Sarah")
    assert_equal 2, reporter.queue.count

    reporter.queue_clear

    assert_equal 0, reporter.queue.count
  end

  def test_it_has_default_csv_file
    reporter = Reporter.new
    reporter.load_file

    assert reporter.queue.empty?
  end



end
