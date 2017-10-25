require "minitest/autorun"
require "minitest/pride"
require "./lib/reporter"

class ReporterTest < Minitest::Test
  def test_queue_starts_off_empty
    reporter = Reporter.new

    assert_equal 0, reporter.queue_count
  end

  def test_attendees_starts_off_empty
    reporter = Reporter.new
    reporter.load_attendees("./data/attendee_fixture.csv")

    assert_equal 0, reporter.queue_count
  end

  def test_it_can_find_a_firstname
    reporter = Reporter.new
    reporter.load_attendees("./data/attendee_fixture.csv")
    attendees = reporter.find_first_name("SaRah")

    assert_equal 2, attendees.count
    assert_equal 2, reporter.queue_count
  end

  def test_it_can_not_find_a_firstname_if_its_not_in_list
    reporter = Reporter.new
    reporter.load_attendees("./data/attendee_fixture.csv")

    assert_equal [], reporter.find_first_name("John")
  end

  def test_it_clears_queue
    reporter = Reporter.new
    reporter.load_attendees("./data/attendee_fixture.csv")
    reporter.queue_clear

    assert_equal 0, reporter.queue.count
  end

  def test_make_names_pretty
    reporter = Reporter.new
    reporter.load_attendees("./data/attendee_fixture.csv")
    reporter.find_first_name("saRAH")

    assert_equal ["Sarah", "Sarah"], reporter.make_names_pretty("saRAH")
  end

  def test_help_will_list_out_commands
    reporter = Reporter.new
    reporter.help()
    expected = "load\nqueue\nqueue count\nqueue clear\nfind\nfind first_name\nfind last_name\nfind reg_date\nfind email_address\nfind homephone\nfind street\nfind city\nfind state\nfind zipcode\nqueue print\nqueue print by\nqueue save to\nquit\n"

    assert_equal expected, reporter.help
  end

  def test_help_takes_a_command
    reporter = Reporter.new
    reporter.help("queue count")
    expected = "Output how many records are in the current queue"

    assert_equal expected,reporter.help("queue count")
  end

  def test_help_different_commands
    reporter = Reporter.new
    reporter.help("queue print")
    expected = "Print out a tab-delimited data table with a header row following this format:"

    assert_equal expected,reporter.help("queue print")
  end

  def test_queue_prints_resets_queue
    reporter = Reporter.new
    reporter.load_attendees("./data/full_event_attendees (1).csv")
    attendees = reporter.find_first_name("John")
    attendees = reporter.find_first_name("Mary")

    assert_equal 16, attendees.count
  end

  def test_queue_print_by_last_name_prints_attendees_last_names
    reporter = Reporter.new
    reporter.load_attendees("./data/full_event_attendees (1).csv")
    reporter.find_first_name("John")
    reporter.find_first_name("Mary")
    actual = reporter.queue_print("by last_name")
    expected = "Browne\nCampbell\nJoyce\nSchuster\nGrant\nJolly\nCorrado\nTher\nCoomer\nBell\nSkaggs\nShpino\nCostantini\nBastias\nGray\nRodgers"

    assert_equal expected, actual
  end

  def test_queue_prints_out_attendees
    reporter = Reporter.new
    reporter.load_attendees("./data/full_event_attendees (1).csv")
    reporter.find_first_name("John")
    reporter.find_first_name("Mary")
    reporter.queue_print

    assert_equal 16, reporter.queue_count
  end

  def test_queue_can_find_city_by_criteria
    reporter = Reporter.new
    reporter.load_attendees("./data/full_event_attendees (1).csv")
    reporter.find_city("Salt Lake City")
    actual = reporter.queue.count

    assert_equal 13, actual
  end

  def test_queue_can_save_to_a_sample_csv
    reporter = Reporter.new
    reporter.load_attendees("./data/full_event_attendees (1).csv")
    reporter.find_city("Salt Lake City")

    assert_equal 13, reporter.queue.count

    reporter.queue_save("city_sample.csv")

    # assert IO.readlines('./city_sample.csv')[14]
  end


end
