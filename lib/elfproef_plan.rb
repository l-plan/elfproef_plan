require "elfproef_plan/engine"

	class BsnValidator < ActiveModel::EachValidator
		def validate_each(record,attribute,value)
			record.errors.add(attribute, options[:message]|| "ongeldig bsn nr", options) unless ElfproefPlan::ElfProef.new(value).validBsn
	  	end
	end

	class RekeningValidator < ActiveModel::EachValidator

		def validate_each(record,attribute,value)
			record.errors.add(attribute, options[:message] || "ongeldig rekening nr", options) unless ElfproefPlan::ElfProef.new(value).validRekening
	  	end
	end

	class LoonheffingennummerValidator < ActiveModel::EachValidator

		def validate_each(record,attribute,value)
			record.errors.add(attribute, options[:message] || "ongeldig loonheffingennummer nr", options) unless ElfproefPlan::ElfProef.new(value).validLoonheffingennummer
	  	end
	end

module ElfproefPlan
	class ElfProef
		attr_accessor :nr, :nrs,  :letter, :subnr

		def initialize(input)
			@nrs = (2..9).to_a.reverse
      
      		@nr, @letter, @subnr = input.to_s.scan(/[0-9a-zA-Z+$]/).join().upcase().match(/([0-9]*)([A-Z]*)([0-9]*)/i).captures.map{|x| x.scan(/./)}
      		@nr, @subnr = @nr.map{|x| x.to_i}, @subnr.map{|x| x.to_i}

		end

		def validRekening
			return false unless [9, 10].include? @nr.length
			@nrs.unshift 10 if @nr.length == 10
			elfproef(1)
		end

		def validBsn
			return false if @nr.length > 9
			@nr.unshift 0 while @nr.length < 9
			return false if @nr[0,3].sum < 1
			elfproef(-1)
		end

		def validLoonheffingennummer
			return false unless validBsn
			return false unless @letter==["L"]
			return false unless @subnr.reduce(:+)>0
			true

		end

	private



		def elfproef(b)
			@nrs.push b
			reeks = @nr.zip(@nrs)
			@nrs.pop
			som = reeks.inject(0){|som, x| som + (x[0]*x[1]) }
			som.remainder(11)==0 && som>0
			
		end
	end

end
