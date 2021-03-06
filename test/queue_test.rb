require "minitest/autorun"
require "minitest/pride"
require "./lib/queue"

class QueueTest < MiniTest::Test
  def test_queue_starts_off_empty
    queue = Queue.new

    assert_equal 0, queue.queue_count
  end

  def test_attendees_starts_off_empty
    queue = Queue.new

    assert_equal [], queue.queue
  end

  def test_load_attendees_loads_csv_file
    queue = Queue.new
    queue.load_attendees("attendee_fixture.csv")

    assert_equal 50, queue.attendees.length
  end

  def test_load_attendees_loads_default_csv
    queue = Queue.new
    queue.load_attendees

    assert_equal 5175, queue.attendees.length
  end

  def test_queue_can_find_first_name_john
    queue = Queue.new
    queue.load_attendees
    actual = queue.find_first_name("John")

    assert_equal "John", actual.first.first_name

    actual = queue.queue_count

    assert_equal 63, actual
  end

  def test_queue_clear_empties_queue
    queue = Queue.new
    queue.load_attendees
    queue.queue_clear

    assert_equal [], queue.queue
  end

  def test_help_returns_list_of_commands
    queue = Queue.new
    actual = queue.help
    expected = "Available commands:\n<load <filename>>\n<find <attribute> <criteria>>\n<queue count>\n<queue clear>\n<queue print>\n<queue print by <attribute>>\n<queue save to <filename.csv>>\n<queue export html <filename.csv>>"

    assert_equal expected, actual
  end

  def test_help_queue_count_explains_queue_count_function
    queue = Queue.new
    actual = queue.help("help queue count")
    expected = "Outputs how many records are in the current queue."

    assert_equal expected, actual
  end

  def test_help_queue_print_explains_printing_function
    queue = Queue.new
    actual = queue.help("help queue print")
    expected = "Prints out current queue populated with current queue."

    assert_equal expected, actual
  end

  def test_help_queue_save_to_explains_save_function
    queue = Queue.new
    actual = queue.help("help queue save to")
    expected = "<queue save to <filename.csv>> : Export the current queue to the specified filename as a CSV."

    assert_equal expected, actual
  end

  def test_help_queue_export_html_explains_html_exporting_function
    queue = Queue.new
    actual = queue.help("help queue export html")
    expected = "<queue export html <filename.csv>> : Export the current queue to the specified filename as a valid HTML file."

    assert_equal expected, actual
  end

  def test_help_queue_print_explains_printing_function
    queue = Queue.new
    actual = queue.help("help find")
    expected = "<find <attribute> <criteria>> : Populates the queue with all records matching the criteria for the given attribute."

    assert_equal expected, actual
  end

  def test_help_queue_clear_explains_clearing_function
    queue = Queue.new
    actual = queue.help("help queue clear")
    expected = "Empty the queue."

    assert_equal expected, actual
  end

  def test_find_first_name_mary_finds_all_mary_attendees
    queue = Queue.new
    queue.load_attendees
    actual = queue.find_first_name("Mary")

    assert_equal "Mary", actual.first.first_name

    actual = queue.queue_count

    assert_equal 16, actual
  end

  def test_find_by_first_name_is_case_insensitive
    queue = Queue.new
    queue.load_attendees
    actual = queue.find_first_name("mArY")

    assert_equal "Mary", actual.first.first_name

    actual = queue.queue_count

    assert_equal 16, actual
  end

  def test_find_last_name_smith_finds_all_mary_attendees
    queue = Queue.new
    queue.load_attendees
    actual = queue.find_last_name("Smith")

    assert_equal "Smith", actual.first.last_name

    actual = queue.queue_count

    assert_equal 35, actual
  end

  def test_find_by_last_name_is_case_insensitive
    queue = Queue.new
    queue.load_attendees
    actual = queue.find_last_name("SmITh")

    assert_equal "Smith", actual.first.last_name

    actual = queue.queue_count

    assert_equal 35, actual
  end

  def test_find_by_first_name_can_find_two_word_first_names
    queue = Queue.new
    queue.load_attendees
    actual = queue.find_first_name("Mary kate")

    assert_equal "Mary Kate", actual.first.first_name

    actual = queue.queue_count

    assert_equal 1, actual
  end

  def test_queue_print_prints_out_current_queue
    queue = Queue.new
    queue.load_attendees
    actual = queue.find_first_name("mary kate")
    count = queue.queue_count
    expected = "Curry,Mary Kate,wmppydaymaker@jumpstartlab.com,21230,Baltimore,MD,1509 Jackson Street,202-328-1000"

    assert_equal 1, count
    assert_equal "Mary Kate", actual.first.first_name
    assert_equal expected, queue.queue_print
  end

  def test_queue_print_by_last_name_prints_out_ordered_current_queue
    queue = Queue.new
    queue.load_attendees
    queue.find_first_name("mary")
    count = queue.queue_count
    actual = queue.queue_print("by last_name").split("\n")

    assert_equal 16, count
    assert actual.first.include?("Bastias")
    assert actual.last.include?("Ther")
  end

  def test_queue_find_city_can_find_by_salt_lake_city
    queue = Queue.new
    queue.load_attendees
    queue.find_city("Salt Lake City")
    actual = queue.queue_count

    assert_equal 13, actual
  end

  def test_queue_find_state_can_find_by_DC
    queue = Queue.new
    queue.load_attendees
    queue.find_state("dc")
    actual = queue.queue_count

    assert_equal 236, actual

    actual = queue.queue_print("by last_name")

    actual_1 = actual.split('\n').first.split(",")[0]
    actual_2 = actual.split('\n').first.split(",")[5]

    assert_equal "Abraham", actual_1
    assert_equal "DC", actual_2
  end

  def test_save_to_saves_current_queue_to_csv_file
    queue = Queue.new
    queue.load_attendees
    queue.find_city("Salt Lake City")

    assert_equal 13, queue.queue_count

    queue.save_to("city_sample.csv")

    assert File.exist?("city_sample.csv")
  end
end
