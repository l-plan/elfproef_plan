class ElfProef
    constructor: (input) ->
      @nrs = [2..9].reverse()
      [@match, @nummer, @letter, @subnummer] = input.toString().match(/[0-9a-z]/gi).join("").toUpperCase().match(/([0-9]*)([A-Z]*)([0-9]*)/i)

    elfproef: (a) -> 
        @nrs.push(a)
        som = 0
        reeks = zip(@nrs, @nr)
   
        som+= x[0]*x[1] for x in reeks
        som % 11 == 0 && som>0

    validBsn: () ->
        @nr = @nummer.match(/./g)
        return false if @nr.length > 9
        @nr.unshift(0) while @nr.length < 9

        @elfproef(-1)

    validRekening: () ->
        @nr = @nummer.match(/./g)
        return false unless @nr.length in [9,10]
        @nrs.unshift 10 if @nr.length==10
        
        @elfproef(1)

    validLoonheffingennummer: () ->
        @nr = @nummer.match(/./g)
        check = true
        check = false unless @validBsn()
        check = false unless @letter == "L"
        check = false unless @subnummer && @subnummer.length==2
        check = false unless @subnummer && @subnummer.match(/./g).reduce (a,b) -> parseInt(a) + parseInt(b) > 0
        check

        


zip = () ->
  lengthArray = (arr.length for arr in arguments)
  length = Math.min(lengthArray...)
  for i in [0...length]
    arr[i] for arr in arguments


$ ->
  $(document).on 'blur', '.checkMyBsn',  ->
    if @value
      e = new ElfProef(@value)
      if e.validBsn()
        $(".checkMyBsn").val(e.nummer) 
        $(".bsn_message").text("ok")
      else
        $(".bsn_message").text("geen geldig bsn-nummer")

   $(document).on 'blur', '.checkMyRekening',  ->
    if @value
      e = new ElfProef(@value) 
      if e.validRekening()
        $(".checkMyRekening").val(e.match) 
        $(".rekening_message").text("ok")
      else
        $(".rekening_message").text("geen geldig rekening-nummer")


   $(document).on 'blur', '.checkMyLoonheffing',  ->
    if @value
      e = new ElfProef(@value)
      if e.validLoonheffingennummer()
        $(".checkMyLoonheffing").val(e.match) 
        $(".loonheffing_message").text("ok")
      else
        $(".loonheffing_message").text("geen geldig loonheffingen-nummer") if @value

root = exports ? window
root.ElfProef = ElfProef
