require "account_validator"

describe AccountValidator do
  it "validates account number to check if it is valid or not" do
    subject.validate_account_number([3,4,5,8,8,2,8,6,5]).should be_true
    subject.validate_account_number([0,0,0,0,0,0,0,5,1]).should be_true
    subject.validate_account_number([0,0,0,0,0,0,0,0,0]).should be_true
    subject.validate_account_number([1,2,3,4,5,6,7,8,9]).should be_true
    subject.validate_account_number([3,4,5,8,8,2,8,6,6]).should be_false
    subject.validate_account_number([1,1,1,1,1,1,1,1,1]).should be_false
    subject.validate_account_number([9,8,7,6,5,4,3,2,1]).should be_false
  end
end

