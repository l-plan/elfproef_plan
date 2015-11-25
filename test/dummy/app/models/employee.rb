class Employee < ActiveRecord::Base
	validates :number, bsn: {message: "mijn boodschapje"}
	validates :name, length: {minimum: 5}
	validates :accountnumber, rekening: true
end
