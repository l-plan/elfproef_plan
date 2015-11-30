###### 0.0.4
added validation for dutch tax-number
refactored ElfProef
refactored RexEx functions

###### 0.0.3
start logging changes

server-side ElfProef.new no longer accepts a valid number which is actually polluted with non-digit-characters, which were filtered-out.

client-side input is replaced with the actual, filtered and correct string when validation succeeds.

fixed bug in test/dummy/app/assets/javascripts/application.js which required a deleted file.