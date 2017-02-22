require "date"

class Person
  attr_accessor :first_name,
                :surname,
                :dob,
                :emails,
                :phone_numbers
  attr_accessor :emails,
                :phone_numbers

  def initialize first_name, surname, dob="1 Jan 1900"
    @first_name = first_name.capitalize
    @surname = surname.capitalize
    @dob = Date.parse(dob)
    @emails = []
    @phone_numbers = []
  end

  def fullname
    "#{@first_name} #{@surname}"
  end

  # Email methods
  def add_email email
    @emails << email
  end

  def remove_email(index)
    if index.is_a? Numeric
      @emails.delete_at(index)
    else
      return nil
    end
  end

  # Phone numbers
  def add_phone phone_number
    @phone_numbers << phone_number
  end
  
  def remove_phone(index)
    if index.is_a? Numeric
      @phone_numbers.delete_at(index)
    else
      return nil
    end
  end

  # Describe
  def to_s
    "#{fullname} was born on #{@dob}.\n Their email addresses are: #{@emails}.\n Their phone numbers are #{@phone_numbers}"
  end

end