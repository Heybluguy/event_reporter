require "minitest/autorun"
require "minitest/pride"
require "./lib/attendee"

class AttendeeTest < Minitest::Test
  def test_it_exists
    attendee = Attendee.new({id:            "1",
                             regdate:       "11/12/08 10:47",
                             first_name:    "Allison",
                             last_name:     "Nguyen",
                             email_address: "arannon@jumpstartlab.com",
                             homephone:     "6154385000",
                             street:        "3155 19th St NW",
                             city:          "Washington",
                             state:         "DC",
                             zipcode:       "20010"}
                           )

    assert_instance_of Attendee, attendee
  end

  def test_attendee_has_a_registration_date
    attendee = Attendee.new({id:            "1",
                             regdate:       "11/12/08 10:47",
                             first_name:    "Allison",
                             last_name:     "Nguyen",
                             email_address: "arannon@jumpstartlab.com",
                             homephone:     "6154385000",
                             street:        "3155 19th St NW",
                             city:          "Washington",
                             state:         "DC",
                             zipcode:       "20010"}
                           )

    assert_equal "11/12/08 10:47", attendee.registration_date
  end

  def test_attendee_has_a_name
    attendee = Attendee.new({id:            "1",
                             regdate:       "11/12/08 10:47",
                             first_name:    "Allison",
                             last_name:     "Nguyen",
                             email_address: "arannon@jumpstartlab.com",
                             homephone:     "6154385000",
                             street:        "3155 19th St NW",
                             city:          "Washington",
                             state:         "DC",
                             zipcode:       "20010"}
                           )

    assert_equal "Allison", attendee.first_name
  end

  def test_attendee_has_a_lastname
    attendee = Attendee.new({id:            "1",
                             regdate:       "11/12/08 10:47",
                             first_name:    "Allison",
                             last_name:     "Nguyen",
                             email_address: "arannon@jumpstartlab.com",
                             homephone:     "6154385000",
                             street:        "3155 19th St NW",
                             city:          "Washington",
                             state:         "DC",
                             zipcode:       "20010"}
                           )

    assert_equal "Nguyen", attendee.last_name
  end

  def test_attendee_has_a_email_address
    attendee = Attendee.new({id:            "1",
                             regdate:       "11/12/08 10:47",
                             first_name:    "Allison",
                             last_name:     "Nguyen",
                             email_address: "arannon@jumpstartlab.com",
                             homephone:     "6154385000",
                             street:        "3155 19th St NW",
                             city:          "Washington",
                             state:         "DC",
                             zipcode:       "20010"}
                           )

    assert_equal "arannon@jumpstartlab.com", attendee.email_address
  end

  def test_attendee_has_a_home_phone
    attendee = Attendee.new({id:            "1",
                             regdate:       "11/12/08 10:47",
                             first_name:    "Allison",
                             last_name:     "Nguyen",
                             email_address: "arannon@jumpstartlab.com",
                             homephone:     "6154385000",
                             street:        "3155 19th St NW",
                             city:          "Washington",
                             state:         "DC",
                             zipcode:       "20010"}
                           )

    assert_equal "615-438-5000", attendee.homephone
  end

  def test_attendee_has_a_street
    attendee = Attendee.new({id:            "1",
                             regdate:       "11/12/08 10:47",
                             first_name:    "Allison",
                             last_name:     "Nguyen",
                             email_address: "arannon@jumpstartlab.com",
                             homephone:     "6154385000",
                             street:        "3155 19th St NW",
                             city:          "Washington",
                             state:         "DC",
                             zipcode:       "20010"}
                           )

    assert_equal "3155 19th St NW", attendee.street
  end

  def test_attendee_has_a_city
    attendee = Attendee.new({id:            "1",
                             regdate:       "11/12/08 10:47",
                             first_name:    "Allison",
                             last_name:     "Nguyen",
                             email_address: "arannon@jumpstartlab.com",
                             homephone:     "6154385000",
                             street:        "3155 19th St NW",
                             city:          "Washington",
                             state:         "DC",
                             zipcode:       "20010"}
                           )

    assert_equal "Washington", attendee.city
  end

  def test_attendee_has_a_state
    attendee = Attendee.new({id:            "1",
                             regdate:       "11/12/08 10:47",
                             first_name:    "Allison",
                             last_name:     "Nguyen",
                             email_address: "arannon@jumpstartlab.com",
                             homephone:     "6154385000",
                             street:        "3155 19th St NW",
                             city:          "Washington",
                             state:         "DC",
                             zipcode:       "20010"}
                           )

    assert_equal "DC", attendee.state
  end

  def test_attendee_has_a_zipcode
    attendee = Attendee.new({id:            "1",
                             regdate:       "11/12/08 10:47",
                             first_name:    "Allison",
                             last_name:     "Nguyen",
                             email_address: "arannon@jumpstartlab.com",
                             homephone:     "6154385000",
                             street:        "3155 19th St NW",
                             city:          "Washington",
                             state:         "DC",
                             zipcode:       "20010"}
                           )

    assert_equal "20010", attendee.zipcode
  end

end
