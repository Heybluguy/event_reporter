require "minitest/autorun"
require "minitest/pride"
require "./lib/reader"
require "pry"

class ReaderTest < Minitest::Test
  def test_it_exist
    reader = Reader.new("./data/attendee_fixture.csv")

    assert_instance_of Reader, reader
  end

  def test_it_can_read_csv_file
    reader = Reader.new("./data/attendee_fixture.csv")

    assert_instance_of Array, reader.content
  end

  def test_it_can_create_a_new_attendee
    reader = Reader.new("./data/attendee_fixture.csv")

    assert_instance_of Array, reader.content
    assert_instance_of Attendee, reader.content.first
  end
end
