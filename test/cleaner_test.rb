require "minitest/autorun"
require "minitest/pride"
require "./lib/cleaner"

class CleanerTest < Minitest::Test
  def test_it_cleans_a_state
    cleaner = Cleaner.new
    attendee = Attendee.new({id:           "1",
                            regdate:       "11/12/08 10:47",
                            first_name:    "mary kate",
                            last_name:     "nGuyen",
                            email_address: "arannon@jumpstartlab.com",
                            homephone:     "6154385000",
                            street:        "3155 19th St NW",
                            city:          "washington",
                            state:         "Dc",
                            zipcode:       "10"}
                            )
    actual = cleaner.tidy_state(attendee.state)

    assert_equal "DC", actual
  end

  def test_it_cleans_a_zipcode
    cleaner = Cleaner.new
    attendee = Attendee.new({id:           "1",
                            regdate:       "11/12/08 10:47",
                            first_name:    "mary kate",
                            last_name:     "Nguyen",
                            email_address: "arannon@jumpstartlab.com",
                            homephone:     "6154385000",
                            street:        "3155 19th St NW",
                            city:          "washington",
                            state:         "Dc",
                            zipcode:       "10"}
                        )
    actual = cleaner.tidy_zipcode(attendee.zipcode)

    assert_equal "00010", actual
  end

  def test_it_cleans_a_first_name
    cleaner = Cleaner.new
    attendee = Attendee.new({id:           "1",
                            regdate:       "11/12/08 10:47",
                            first_name:    "mary kate",
                            last_name:     "Nguyen",
                            email_address: "arannon@jumpstartlab.com",
                            homephone:     "6154385000",
                            street:        "3155 19th St NW",
                            city:          "washington",
                            state:         "Dc",
                            zipcode:       "10"}
                        )
    actual = cleaner.tidy_first_name(attendee.first_name)

    assert_equal "Mary Kate", actual
  end

  def test_it_cleans_a_last_name
    cleaner = Cleaner.new
    attendee = Attendee.new({id:           "1",
                            regdate:       "11/12/08 10:47",
                            first_name:    "mary kate",
                            last_name:     "nGuyen",
                            email_address: "arannon@jumpstartlab.com",
                            homephone:     "6154385000",
                            street:        "3155 19th St NW",
                            city:          "washington",
                            state:         "Dc",
                            zipcode:       "10"}
                        )
    actual = cleaner.tidy_last_name(attendee.last_name)

    assert_equal "Nguyen", actual
  end

  def test_it_cleans_a_city
    cleaner = Cleaner.new
    attendee = Attendee.new({id:           "1",
                            regdate:       "11/12/08 10:47",
                            first_name:    "mary kate",
                            last_name:     "Nguyen",
                            email_address: "arannon@jumpstartlab.com",
                            homephone:     "6154385000",
                            street:        "3155 19th St NW",
                            city:          "washington",
                            state:         "Dc",
                            zipcode:       "10"}
                        )
    actual = cleaner.tidy_city(attendee.city)

    assert_equal "Washington", actual
  end
end
