require 'test_helper'

describe Employee do
	before do
		@employee = Employee.new(name: 'Jantje', number: 123456782, accountnumber: 376815914)
	end


	 it "check bsn with input number that is false" do
    	@employee.number = 123456781
    	@employee.valid?
    	@employee.errors.messages[:number].must_equal ["mijn boodschapje"]
    end

	 it "check rekening with input number that is false" do
    	@employee.accountnumber = 123456781
    	@employee.valid?
    	@employee.errors.messages[:accountnumber].must_equal ["ongeldig rekening nr"]
    end

	 it "check rekening with name too short" do
    	@employee.name= 'jan'
    	@employee.valid?
    	@employee.errors.messages[:name].must_equal ["is too short (minimum is 5 characters)"]
    end


	 it "check the record, must be correct!" do
    	@employee.valid?.must_equal true
    end


end
