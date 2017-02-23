require 'date'

describe Person do
  it 'should initialize' do
    a = Person.new 'joe', 'bloggs', '1 Jan 1990'
    expect(a.dob).to eq Date.parse('1 Jan 1990')
    expect(a.first_name).to eq 'Joe'
    expect(a.surname).to eq 'Bloggs'
  end

  it 'should return full name' do
    a = Person.new 'joe', 'bloggs'
    expect(a.fullname).to eq 'Joe Bloggs'
  end

  it 'should add and show emails' do
    a = Person.new 'joe', 'bloggs'
    expect(a.emails).to eq []
    a.add_email 'joe@foo.com'
    a.add_email 'joe.bloggs@work.com'
    expect(a.emails).to eq ['joe@foo.com', 'joe.bloggs@work.com']
  end

  it 'should add and show phone numbers' do
    a = Person.new 'joe', 'bloggs'
    expect(a.phone_numbers).to eq []
    a.add_phone "07712345678"
    a.add_phone "02012345678"
    expect(a.phone_numbers).to eq ["07712345678", "02012345678"]
  end

  it 'should remove email' do
    a = Person.new 'joe', 'bloggs'
    expect(a.emails).to eq []
    a.add_email 'joe@foo.com'
    a.add_email 'joe.bloggs@work.com'
    a.remove_email 0
    expect(a.emails).to eq ['joe.bloggs@work.com']
  end

  it 'should describe the Person instance' do
    a = Person.new 'joe', 'bloggs', '1 Jan 1990'
    a.add_email 'joe@foo.com'
    a.add_phone "07712345678"
    a.add_phone "02012345678"
    expect(a.to_s).to eq "Joe Bloggs was born on 1990-01-01.\n Their email addresses are: [\"joe@foo.com\"].\n Their phone numbers are [\"07712345678\", \"02012345678\"]"
  end

end

describe FamilyMember do
  it 'should initialize' do
    a = FamilyMember.new 'joe', 'bloggs', '1 Jan 1990', 'father'
    expect(a.relationship).to eq 'Father'
  end

end

describe AddressBook do
  it 'should initialize'  do
    book = AddressBook.new
    expect(book.people).to eq []
  end
  
  it 'should add people to the address book' do
    a = Person.new 'joe', 'bloggs',
    b = Person.new 'rick', 'sanchez'
    book = AddressBook.new
    book.add(a)
    book.add(b)
    expect(book.list).to eq "Address Book \n------------\n Entry 1: Joe Bloggs \nEntry 2: Rick Sanchez"
  end

end







