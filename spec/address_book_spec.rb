require 'date'

describe Person do

  let(:a) {Person.new 'joe', 'bloggs', '1 Jan 1990'}

  it 'should initialize' do
    expect(a.dob).to eq Date.parse('1 Jan 1990')
    expect(a.first_name).to eq 'Joe'
    expect(a.surname).to eq 'Bloggs'
    expect(a.emails).to eq []
    expect(a.phone_numbers).to eq []
  end

  it 'should initialize without a date' do
    a = Person.new 'joe', 'bloggs'
    expect(a.dob).to eq nil
    expect(a.first_name).to eq 'Joe'
    expect(a.surname).to eq 'Bloggs'
    expect(a.emails).to eq []
    expect(a.phone_numbers).to eq []
  end

  it 'should return full name' do
    expect(a.fullname).to eq 'Joe Bloggs'
  end

  it 'should add and show emails' do
    a.add_email 'joe@foo.com'
    a.add_email 'joe.bloggs@work.com'
    expect(a.emails).to eq ['joe@foo.com', 'joe.bloggs@work.com']
  end

  it 'should add and show phone numbers' do
    a.add_phone "07712345678"
    a.add_phone "02012345678"
    expect(a.phone_numbers).to eq ["07712345678", "02012345678"]
  end

  it 'should remove email' do
    a.add_email 'joe@foo.com'
    a.add_email 'joe.bloggs@work.com'
    a.remove_email 0
    expect(a.emails).to eq ['joe.bloggs@work.com']
  end

  it 'should describe the Person instance' do
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

  let(:a)  {Person.new 'joe', 'bloggs'}
  let(:b) {Person.new 'rick', 'sanchez'}
  let(:book) {AddressBook.new}

  it 'should initialize'  do
    expect(book.people).to eq []
  end
  
  it 'should add people to the address book' do
    book.add(a)
    book.add(b)
    expect(book.people).to eq [a, b]
  end

  it 'should print out the address book' do
    book.add(a)
    book.add(b)
    expect{book.list}.to output("Address Book\n-------------\nEntry 1: Joe Bloggs\nEntry 2: Rick Sanchez\n").to_stdout
  end


end