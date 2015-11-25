# ElfproefPlan

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'elfproef_plan'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install elfproef_plan




## Why this gem

Main purpose is to provide boilerplate code to L-Plan-applications which require the validation af a social-security- or bankaccount- number.




* ElfProef
	* pure ruby check
	* rails validation
	* javascript tool


## class ElfproefPlan::ElfProef

###initialize
ElfproefPlan::ElfProef.new takes only one parameter, an integer or a string. Either one will be conversed internally into an array, on which you can invoke two methods:

* validRekenening for a bank-accountnumber
 
* validBsn for a dutch bsn-number

the output will be true or false

use these for server-side validations


###validations

in any model just include

```ruby
validates :my_attribute_name, bsn: true
```
or optional

```ruby
validates :my_attribute_name, bsn: {message: "this message overrides the default"}
```


```ruby
validates :my_attribute_name, rekeningnummer: true
```
or optional

```ruby
validates :my_attribute_name, rekeningnummer: {message: "this message overrides the default"}
```

it will handle validations just like rails does with other validations.

the rekening-validation just validates the plain, old accountnumber. Validation of BIC-code is yet to be implemented.

## elfproef.js.coffee

ElfProef takes an value, and validates the given number/string.

* it calls ElfProef.new(@value).validBsn() to check a bsn-number

* it calls ElfProef.new(@value).validRek() to check a bank-account-number

To use these client-side checks, just add a class "checkMyBsn" or "checkMyRekening" to your input-field.
Add a div with class "rekening_message" or "bsn_message" to yout form to display the returned message.


The code can be included by requiring elfproef_plan, or just the elfproef-file:

```js
//= require elfproef_plan
```
or

```js
//= require elfproef/elfproef
```


To call a check on another field, alter the following code to your liking.

example:
```coffee
$ ->
  $(document).on 'blur', '.checkMyBsn',  ->
    if new ElfProef(@value).validBsn()
      $(".bsn_message").text("ok")
    else
      $(".bsn_message").text("geen geldig bsn-nummer")
```


