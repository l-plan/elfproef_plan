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

module ElfproefPlan
	class ElfProef
		attr_accessor :nr, :nrs

		def initialize(nr)
			@nr = nr.to_s.scan(/./).map{|x| x.to_i} if nr.to_s.scan(/[\d+$]/)==nr.to_s.scan(/./)
			@nrs = (2..9).to_a.reverse
		end

		def validRekening
			return false unless @nr
			return false unless [9, 10].include? @nr.length
			nrs.unshift 10 if @nr.length == 10
			elfproef(1)
		end

		def validBsn
			return false unless @nr
			return false if @nr.length > 9
			@nr.unshift 0 while @nr.length < 9
			return false if @nr[0,3].sum < 1
			elfproef(-1)
		end

	private



		def elfproef(b)
			
			som=0

			@nrs.push b
			reeks = @nr.zip(@nrs)
			reeks.each{|x| som+= x[0]*x[1]}
			som.remainder(11)==0 && som>0
			
		end
	end

end
