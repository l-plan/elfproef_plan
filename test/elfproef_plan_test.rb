require 'test_helper'

describe ElfproefPlan::ElfProef do


  describe "check if elfproef is initialized correctly" do

    it "check nr with a valid input" do
    	@elfproef = ElfproefPlan::ElfProef.new(123456789)
    	@elfproef.nr.must_equal [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    it "check nr with input that is too long" do
    	@elfproef = ElfproefPlan::ElfProef.new(1234567891234)
    	@elfproef.nr.must_equal [1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4]
    end

    it "check nr with input that is too short" do
    	@elfproef = ElfproefPlan::ElfProef.new(1234)
    	@elfproef.nr.must_equal [1, 2, 3, 4]
    end
  end

  describe "check elfproef validBsn method" do

    it "check a valid bsn" do
    	@elfproef = ElfproefPlan::ElfProef.new(123456782)
    	@elfproef.validBsn.must_equal true
    end


  end


  describe "check elfproef validRekening method" do

    it "check a valid rekeningnummer" do
    	@elfproef = ElfproefPlan::ElfProef.new(123456789)
    	@elfproef.validRekening.must_equal true
    end

    it "check a invalid rekeningnummer, i.e. too short" do
    	@elfproef = ElfproefPlan::ElfProef.new(1234567)
    	@elfproef.validRekening.must_equal false
    end

    it "check a invalid rekeningnummer, i.e. too long" do
    	@elfproef = ElfproefPlan::ElfProef.new(12345678901)
    	@elfproef.validRekening.must_equal false
    end
 
    it "check a valid rekeningnummer, with 10digits" do
    	@elfproef = ElfproefPlan::ElfProef.new(3661628089)
    	@elfproef.validRekening.must_equal true
    end
  end

  describe "check een aantal rekeningnummers met 9 cijfers" do
  	reknrs = [376815914,167832875,486485471,381694089,110550803,959701141,467648212,444153934,368514005,615918719,786923113]
  	reknrs.each do |rek|
  		it "checks rekening nr met 9 cijfers #{rek}" do

  			ElfproefPlan::ElfProef.new(rek).validRekening.must_equal true
  		end
  	end
  end

  describe "check een aantal rekeningnummers met 10 cijfers" do
  	reknrs = [3629733190,3629734561,3175625762,3661628089,1094830690,1475512619,3314634013]
  	reknrs.each do |rek|
  		it "checks rekening met 10 cijfers nr #{rek}" do

  			ElfproefPlan::ElfProef.new(rek).validRekening.must_equal true
  		end
  	end


  end


end