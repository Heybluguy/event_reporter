require "minitest/autorun"
require "minitest/pride"
require "./lib/reader"

class ReaderTest < Minitest::Test
  def test_it_exist
    reader = Reader.new("attendee_fixture.csv")

    assert_instance_of Reader, reader
  end

  def test_it_can_read_csv_file
    reader = Reader.new("attendee_fixture.csv")

    assert_instance_of Array, reader.content
    refute reader.content.empty?
  end

  def test_it_can_create_a_new_attendee
    reader = Reader.new("attendee_fixture.csv")

    assert_instance_of Array, reader.content
    assert_instance_of Attendee, reader.content.first
  end
end
