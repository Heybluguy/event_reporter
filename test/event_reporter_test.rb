require "minitest/autorun"
require "minitest/pride"
require "./lib/event_reporter"

class ReporterTest < Minitest::Test
  def test_queue_has_a_count
    reporter = Reporter.new
    reporter.populate_queue("./data/attendee_fixture.csv")
    assert_equal 10, reporter.queue.count
  end

  def test_it_can_find_a_firstname
    reporter = Reporter.new
    reporter.populate_queue("./data/attendee_fixture.csv")

    assert_equal "Shiyu", reporter.find_first_names("Shiyu")
  end

  def test_it_can_not_find_a_firstname
    reporter = Reporter.new
    reporter.populate_queue("./data/attendee_fixture.csv")

    assert_equal "Not found", reporter.find_first_names("John")
  end
end
