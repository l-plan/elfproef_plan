class ElfProef
    constructor: (nr) ->
      @nr = nr.toString().match(/[\d+$]/g)
      @nrs = [2..9].reverse()

    elfproef: (a) -> 
        @nrs.push(a)
        som = 0
        reeks = zip(@nrs, @nr)
   
        som+= x[0]*x[1] for x in reeks
        som % 11 == 0 && som>0

    validBsn: () ->
        return false if @nr.length > 9
        while @nr.length < 9
          @nr.unshift(0)

        @elfproef(-1)

    validRekening: () ->
        return false unless @nr.length in [9,10]
        if @nr.length==10
          @nrs.unshift 10

        @elfproef(1)


zip = () ->
  lengthArray = (arr.length for arr in arguments)
  length = Math.min(lengthArray...)
  for i in [0...length]
    arr[i] for arr in arguments


$ ->
  $(document).on 'blur', '.checkMyBsn',  ->
    if new ElfProef(@value).validBsn()
      $(".bsn_message").text("ok")
    else
      $(".bsn_message").text("geen geldig bsn-nummer")

   $(document).on 'blur', '.checkMyRekening',  ->
    if new ElfProef(@value).validRekening()
      $(".rekening_message").text("ok")
    else
      $(".rekening_message").text("geen geldig rekening-nummer")



root = exports ? window
root.ElfProef = ElfProef
