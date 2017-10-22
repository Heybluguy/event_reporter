require "minitest/autorun"
require "minitest/pride"
require "./lib/attendee"

class AttendeeTest < Minitest::Test
  def test_it_exists
    attendee = Attendee.new({id:            "1",
                             RegDate:       "11/12/08 10:47",
                             first_Name:    "Allison",
                             last_Name:     "Nguyen",
                             Email_Address: "arannon@jumpstartlab.com",
                             HomePhone:     "6154385000",
                             Street:        "3155 19th St NW",
                             City:          "Washington",
                             State:         "DC",
                             Zipcode:       "20010"}
                           )

    assert_instance_of Attendee, attendee
  end

  def test_attendee_has_a_registration_date
    attendee = Attendee.new({id:            "1",
                             RegDate:       "11/12/08 10:47",
                             first_Name:    "Allison",
                             last_Name:     "Nguyen",
                             Email_Address: "arannon@jumpstartlab.com",
                             HomePhone:     "6154385000",
                             Street:        "3155 19th St NW",
                             City:          "Washington",
                             State:         "DC",
                             Zipcode:       "20010"}
                           )

    assert_equal "11/12/08 10:47", attendee.registration_date
  end
end
