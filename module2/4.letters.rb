alphabet = ('a'..'z').to_a
vowels_arr = ["e", "i", "o", "u", "y"]
vowels_hash = {}
i=0

vowels_arr.each do |vowel|
  vowels_hash[vowels_arr[i]] = alphabet.index(vowel)+1
  i+=1
end

puts vowels_hash
