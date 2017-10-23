require "minitest/autorun"
require "minitest/pride"
require "./lib/event_reporter"

class ReporterTest < Minitest::Test
  def test_queue_has_a_count
    reporter = Reporter.new
    reporter.populate_queue("./data/attendee_fixture.csv")
    assert_equal 10, reporter.queue.count
  end

end
