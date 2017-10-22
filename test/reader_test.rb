require "minitest/autorun"
require "minitest/pride"
require "./lib/reader"

class ReaderTest < Minitest::Test
  def test_it_exist
    reader = Reader.new("./data/attendee_fixture.csv")

    assert_instance_of Reader, reader
  end

  def test_it_can_read_csv_file
    reader = Reader.new("./data/attendee_fixture.csv")

    assert_instance_of Array, reader.content
  end
end
