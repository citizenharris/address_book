require 'date'

describe Person do
  it 'should initialize' do
    a = Person.new 'joe', 'bloggs', '1 Jan 1990'
    expect(a.dob).to eq (Date.parse('1 Jan 1990'))
    expect(a.first_name).to eq 'joe'
    expect(a.surname).to eq 'bloggs'
  end

  it 'should return full name when asked' do
    a = Person.new 'joe', 'bloggs'
    expect(a.full_name).to eq 'joe bloggs'
  end

  it 'should add and show emails' do
    a = Person.new 'joe', 'bloggs'
    expect(a.emails).to eq []
    a.add_email = 'joe@foo.com'
    a.add_email = 'joe.bloggs@work.com'
    expect(a.emails).to eq ['joe@foo.com']
  end

  it 'should add and show phone numbers' do
    a = Person.new 'joe', 'bloggs'
    expect(a.phone_numbers).to eq []
    a.add_phone = "07712345678"
    a.add_phone = "02012345678"
    expect(a.phone_numbers).to eq ["07712345678", "02012345678"]
  end

  it 'should remove email' do
    a = Person.new 'joe', 'bloggs'
    expect(a.emails).to eq []
    a.add_email = 'joe@foo.com'
    a.add_email = 'joe.bloggs@work.com'
    a.remove_email(0)
    expect(a.emails).to eq ['joe.bloggs@work.com']
  end

  it 'should describe the Person instance' do
    a = Person.new 'joe', 'bloggs', '1 Jan 1990'
    a.add_email = 'joe.bloggs@work.com'
    a.add_phone = "07712345678"
    a.add_phone = "02012345678"
    expect(a.to_s).to eq "Joe Bloggs was born on 1990-01-01.\n Their email addresses are: [\"joe@foo.com\"].\n Their phone numbers are [\"07712345678\", \"02012345678\"]"
  end












end