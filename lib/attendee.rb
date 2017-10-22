class Attendee
  attr_reader :registration_date, :first_name, :last_name, :email_address, :homephone, :street, :city, :state, :zipcode
  def initialize(info)
    @registration_date = info[:RegDate]
    @first_name = info[:first_Name]
    @last_name = info[:last_Name]
    @email_address = info[:Email_Address]
    @homephone = info[:HomePhone]
    @street = info[:Street]
    @city = info[:City]
    @state = info[:State]
    @zipcode = [:Zipcode]
  end

end
