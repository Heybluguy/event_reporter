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
        actual = queue.find_first_name("John").count

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
        expected = "Available commands:\n<load <filename>>\n<find <attribute> <criteria>>\n<queue count>\n<queue clear>\n<queue print>\n<queue print by <attribute>>\n<queue save to <filename.csv>>\n<queue export html <filename.csv>>\n<queue clear>\n<queue clear>\n<queue clear>"

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
end
