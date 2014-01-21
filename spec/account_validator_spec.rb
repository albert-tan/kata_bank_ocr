require "account_validator"

describe AccountValidator do
  it "validates account number to check if it is valid or not" do
    subject.validate_account_number("345882865").should be_true
    subject.validate_account_number("000000051").should be_true
    subject.validate_account_number("000000000").should be_true
    subject.validate_account_number("123456789").should be_true
    subject.validate_account_number("345882866").should be_false
    subject.validate_account_number("111111111").should be_false
    subject.validate_account_number("987654321").should be_false
  end
end

