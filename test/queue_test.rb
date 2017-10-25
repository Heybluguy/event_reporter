require "minitest/autorun"
require "minitest/pride"
require "./lib/queue"

class QueueTest < Minitest::Test
  def test_queue_starts_off_empty
    queue = Queue.new

    assert_equal 0, queue.queue_count
  end

  def test_attendees_starts_off_empty
    queue = Queue.new
    queue.load_attendees("./data/attendee_fixture.csv")

    assert_equal 0, queue.queue_count
  end

  def test_it_can_find_a_firstname
    queue = Queue.new
    queue.load_attendees("./data/attendee_fixture.csv")
    attendees = queue.find_first_name("SaRah")

    assert_equal 2, attendees.count
    assert_equal 2, queue.queue_count
  end

  def test_it_can_not_find_a_firstname_if_its_not_in_list
    queue = Queue.new
    queue.load_attendees("./data/attendee_fixture.csv")

    assert_equal [], queue.find_first_name("John")
  end

  def test_it_clears_queue
    queue = Queue.new
    queue.load_attendees("./data/attendee_fixture.csv")
    queue.queue_clear

    assert_equal 0, queue.queue.count
  end

  def test_make_names_pretty
    queue = Queue.new
    queue.load_attendees("./data/attendee_fixture.csv")
    queue.find_first_name("saRAH")

    assert_equal ["Sarah", "Sarah"], queue.make_names_pretty("saRAH")
  end

  def test_help_will_list_out_commands
    queue = Queue.new
    queue.help()
    expected = "load\nqueue\nqueue count\nqueue clear\nfind\nfind first_name\nfind last_name\nfind reg_date\nfind email_address\nfind homephone\nfind street\nfind city\nfind state\nfind zipcode\nqueue print\nqueue print by\nqueue save to\nquit\n"

    assert_equal expected, queue.help
  end

  def test_help_takes_a_command
    queue = Queue.new
    queue.help("queue count")
    expected = "Output how many records are in the current queue"

    assert_equal expected,queue.help("queue count")
  end

  def test_help_different_commands
    queue = Queue.new
    queue.help("queue print")
    expected = "Print out a tab-delimited data table with a header row following this format:"

    assert_equal expected,queue.help("queue print")
  end

  def test_queue_prints_resets_queue
    queue = Queue.new
    queue.load_attendees("./data/full_event_attendees(1).csv")
    attendees = queue.find_first_name("John")
    attendees = queue.find_first_name("Mary")

    assert_equal 16, attendees.count
  end

  def test_queue_print_by_last_name_prints_attendees_last_names
    queue = Queue.new
    queue.load_attendees("./data/full_event_attendees(1).csv")
    queue.find_first_name("John")
    queue.find_first_name("Mary")
    actual = queue.queue_print("by last_name")
    expected = "2/1/09 15:50, Mary, Bastias, gorench@jumpstartlab.com, 617-721-2000, 28 state st. apt 2, Portland, ME, 4101"

    assert_equal expected, actual.first
  end

  def test_queue_prints_out_attendees
    queue = Queue.new
    queue.load_attendees("./data/full_event_attendees(1).csv")
    queue.find_first_name("John")
    queue.find_first_name("Mary")
    queue.queue_print

    assert_equal 16, queue.queue_count
  end

  def test_queue_can_find_city_by_criteria
    queue = Queue.new
    queue.load_attendees("./data/full_event_attendees(1).csv")
    queue.find_city("Salt Lake City")
    actual = queue.queue.count

    assert_equal 13, actual
  end

  def test_queue_can_save_to_a_sample_csv
    queue = Queue.new
    queue.load_attendees("./data/full_event_attendees(1).csv")
    queue.find_city("Salt Lake City")

    assert_equal 13, queue.queue.count

    queue.queue_save("city_sample.csv")

    # assert IO.readlines('./city_sample.csv')[14]
  end

  def test_it_can_find_by_state
    queue = Queue.new
    queue.load_attendees("./data/full_event_attendees(1).csv")
    queue.find_state("DC")

    assert_equal 236, queue.queue.count
  end

end
