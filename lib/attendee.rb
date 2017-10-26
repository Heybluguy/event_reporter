class Attendee
    attr_accessor :registration_date,
                  :first_name,
                  :last_name,
                  :email_address,
                  :homephone,
                  :street,
                  :city,
                  :state,
                  :zipcode

    def initialize(info)
      @registration_date = info[:regdate]
      @first_name        = info[:first_name].to_s.capitalize
      @last_name         = info[:last_name].to_s.capitalize
      @email_address     = info[:email_address]
      @homephone         = info[:homephone]
      @street            = info[:street]
      @city              = info[:city].to_s.capitalize
      @state             = info[:state].to_s.upcase
      @zipcode           = info[:zipcode]
    end
end
