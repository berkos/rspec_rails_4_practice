require 'spec_helper'

describe Phone do

  it "does not allow duplicate phone numbers per contact" do
    contact = Contact.create(firstname: 'Joe', lastname: 'Tester', 
      email: 'JoeTest@example.com')

    contact.phones.create(phone_type: 'home', phone: '783-445-3452')
    mobile_phone = contact.phones.build(phone_type: 'mobile', phone: '783-445-3452')

    expect(mobile_phone).to have(1).errors_on(:phone)
  end

  it "allows two contacts to share a phone number" do
    contact = Contact.create(firstname: 'Joe', lastname: 'Tester', 
      email: 'JoeTest@example.com')

    contact.phones.create(phone_type: 'home', phone: '783-445-3452')
    other_contact = Contact.new
    other_phone = other_contact.phones.build(phone_type: 'home', phone: '783-445-3452')
    expect(other_phone).to be_valid
  end
end