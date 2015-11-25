
require 'test_helper'
describe "elfproef integration" do
include Capybara::DSL
Capybara.javascript_driver = :selenium
Capybara.current_driver = Capybara.javascript_driver


   it "fill in a correct bsn-number" do
    visit '/employees/new'
	page.find('#employee_number').set('123456782')
	page.find('body').click()
    page.find(".bsn_message").text.must_equal("ok")
  end

   it "fill in a correct rekening-number" do
    visit '/employees/new'
	page.find('#employee_accountnumber').set('123456789')
	page.find('body').click()
    page.find(".rekening_message").text.must_equal("ok")
  end

   it "fill in a incorrect bsn-number" do
    visit '/employees/new'
	page.find('#employee_number').set('123456781')
	page.find('body').click()
    page.find(".bsn_message").text.must_equal("geen geldig bsn-nummer")
  end

   it "fill in a incorrect rekening-number" do
    visit '/employees/new'
	page.find('#employee_accountnumber').set('123456781')
	page.find('body').click()
    page.find(".rekening_message").text.must_equal("geen geldig rekening-nummer")
  end

   it "fill in a incorrect rekening-number with 10 digits" do
    visit '/employees/new'
	page.find('#employee_accountnumber').set('3661628081')
	page.find('body').click()
    page.find(".rekening_message").text.must_equal("geen geldig rekening-nummer")
  end

   it "fill in a correct rekening-number with 10 digits" do
    visit '/employees/new'
	page.find('#employee_accountnumber').set('3661628089')
	page.find('body').click()
    page.find(".rekening_message").text.must_equal("ok")
  end
end