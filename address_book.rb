require 'date'
require 'pry'

class Person
  attr_accessor :first_name, :surname, :dob, :emails, :phone_numbers
  attr_accessor :emails, :phone_numbers

  def initialize first_name, surname, dob=nil
    @first_name = first_name.capitalize
    @surname = surname.capitalize
    @dob = Date.parse(dob) if dob
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



  def print_details
    puts "#{fullname}" 
    puts "-" * fullname.length 
    puts "Date of birth: #{@dob.strftime('%d %b %Y')}" 
    puts "Email addresses: " 
    @emails.each {|i| puts "- #{i}"}
    puts "Phone Numbers:"
    @phone_numbers.each {|i| puts "- #{i}"}
  end
end


class FamilyMember < Person
attr_reader :relationship

 def initialize first_name, surname, dob=nil, relationship=nil
    @relationship = relationship.capitalize if relationship
    super(first_name, surname, dob)
  end
end

class AddressBook
  attr_reader :people

  def initialize
    @people = []
  end

  def add pers
    if pers.is_a? Person
      @people << pers
    else
      raise TypeError, 'This is not a person or family member'
    end
  end

  def list
    puts "Address Book"
    puts "-------------"
    @people.each_with_index do |name, index| puts "Entry #{index+1}: #{name.fullname}"
    end
  end

  def load_yaml file
    YAML.load_file(file)['people'].each do |n|
      if n["relationship"]
        person = FamilyMember.new(n["first_name"], n["surname"], n["dob"], n["relationship"])
      else
        person = Person.new(n["first_name"], n["surname"], n["dob"])
        n['emails'].each do |email|
          person.add_email email
        end
        n['phones'].each do |phone|
          person.add_phone phone
        end
        @people << person
      end
    end
  end
end












