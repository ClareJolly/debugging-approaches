def encode(plaintext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  ciphertext_chars = plaintext.chars.map do |char|
    (65 + cipher.find_index(char)).chr
  end
  ciphertext_chars.join
end

def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'..
    'z').to_a - key.chars)
  plaintext_chars = ciphertext.chars.map do |char|
    cipher[65 - char.ord]
  end
  plaintext_chars.join
end

puts encode("theswiftfoxjumpedoverthelazydog", "secretkey")
puts decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")

=begin
ERROR
Traceback (most recent call last):
        4: from 4.rb:18:in `<main>'
        3: from 4.rb:3:in `encode'
        2: from 4.rb:3:in `map'
        1: from 4.rb:4:in `block in encode'
4.rb:4:in `+': nil can't be coerced into Integer (TypeError)
Exited with status 1 after 0.091 seconds
=end


=begin
in encode method, on line 2, you are selecting letters of the alphabet
from a to z but the ... syntax is not inclusive of the upper range.
You should use .. instead
=end
