require "minitest/autorun"
require "minitest/pride"
require "./lib/event_reporter"

class ReporterTest < Minitest::Test
  def test_queue_has_a_default_count
    reporter = Reporter.new

    assert_equal 0, reporter.queue.count
  end

  def test_queue_has_a_count
    reporter = Reporter.new
    reporter.populate_queue("./data/attendee_fixture.csv")
    assert_equal 10, reporter.queue.count
  end

  def test_it_can_find_a_firstname
    reporter = Reporter.new
    reporter.populate_queue("./data/attendee_fixture.csv")

    attendees = reporter.find_first_names("Sarah")
    assert_equal 2, attendees.count
  end

  def test_it_can_not_find_a_firstname
    reporter = Reporter.new
    reporter.populate_queue("./data/attendee_fixture.csv")

    assert_equal [], reporter.find_first_names("John")
  end

  def test_it_clears_queue
    reporter = Reporter.new
    reporter.populate_queue("./data/attendee_fixture.csv")
    reporter.queue_clear

    assert_equal 0, reporter.queue.count
  end

  
end
