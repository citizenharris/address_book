require "date"

class Person
  attr_accessor :first_name,
                :surname,
                :dob
                :emails
                :phone_numbers

  def initialize first_name, surname, dob=nil
    @first_name = first_name.capitalize
    @surname = surname.capitalize
    @dob = Date.parse(dob)
    @emails = []
    @phone_numbers = []
  end

  def fullname
    "#{first_name.capitalize} #{surname.capitalize}"
  end

  # Email methods
  def add_email email
    @emails << email
  end

  def emails=
    raise StandardError "Can only add (.add_email) or remove emails (.remove_email)"
  end

  def remove_email n
    if n.is_a? Numeric
      @emails.delete_at(n)
    else
      return "Please provide an index"
  end

  # Phone numbers
  def add_phone phone_number
    @phone_numbers << phone_number
  end
  
  def phone=
    raise StandardError "Can only add (.add_phone) or remove phone numbers (.remove_phone)"
  end
  
  def remove_email n
    if n.is_a? Numeric
      @phone_numbers.delete_at(n)
    else
      return "Please provide an index"
  end

  # Describe
  def to_s
    "#{fullname} was born on #{@dob}.\n Their email addresses are: #{@emails}.\n Their phone numbers are #{@phone_numbers}"
    
  end

end