alphabet = ('a'..'z').to_a
vowels_arr = ["e", "i", "o", "u", "y"]
vowels_hash = {}

vowels_arr.each do |vowel|
  vowels_hash[vowel] = alphabet.index(vowel)+1
end

puts vowels_hash
