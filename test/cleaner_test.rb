require "minitest/autorun"
require "minitest/pride"
require "./lib/cleaner"
require "pry"

class CleanerTest < Minitest::Test
  def test_it_takes_a_zipcode
    contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

    assert_equal "", cleaner.clean_zipcode(contents)
  end
end
