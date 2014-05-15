require 'spec_helper'

describe Contact do
  it "is valid with a firstname, lastname and email" do
    contact = Contact.new(
      firstname: 'Antonis',
      lastname: 'Berkakis',
      email: 'aberkakis@gmail.com')
    expect(contact).to be_valid
  end
  it "is valid without first name" do
    expect(Contact.new(firstname: nil)).to have(1).errors_on(:firstname)
  end

  it "is invalid without a last name" do
    expect(Contact.new(lastname: nil)).to have(1).errors_on(:lastname)
  end

  it "is invalid wihout an email adress" do
    expect(Contact.new(email: nil)).to have(1).errors_on(:email)
  end
  it "is invalid with a duplicate email" do
    Contact.create(
      firstname: 'Antonis',
      lastname: 'Berkakis',
      email: 'test@example.com')
    contact = Contact.new(
      firstname: 'Ant',
      lastname: 'Berk',
      email: 'test@example.com')
    expect(contact).to have(1).errors_on(:email)
  end
  it "returns a contact's full name as a string"
end