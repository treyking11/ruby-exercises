#The exercise is to make the last exercise answer clearer, shorter and simpler using methods
def to_words s
  s.split /[\W]+/
end

split_pattern = /[\W]+/

def starts_with_vowel s
  #FIXME Errors on an empty string
  #w{a e i o u} is a quick way of writing ['a', 'e', 'i', 'o', 'u']
  %w{a e i o u}.include? s[0].downcase #Can you see why we use downcase here?
end

snowy = File.read 'the-man-from-snowy-river.txt'

snowy_lines = snowy.lines
snowy_words = to_words snowy

#Example
puts "Here are the lines of Snowy that start with a vowel"

snowy_lines.each do |line|
  puts line if starts_with_vowel line
end

puts
puts "Here are the lines of Snowy that have an odd number of words"
#hint: a % b is the remainder after you divide a by b (called "mod" or "modulus")
# for example 17 % 2 == 1
def odd_lines(array, split_pattern)
  array.each do |l|
    yield(l) if l.split(split_pattern).count.odd?
  end
end

odd_lines(snowy_lines, split_pattern) {|l| puts l}

puts
puts "Here are all the rhyming pairs from the ends of the Snowy lines"
def rhyming_lines(array, split_pattern)
  i = 0
  while i < array.count
    a = array[i].split(split_pattern).last
    b = array[i + 1].split(split_pattern).last
    aa = array[i + 2].split(split_pattern).last
    bb = array[i + 3].split(split_pattern).last
    c = array[i + 4].split(split_pattern).last
    d = array[i + 5].split(split_pattern).last
    cc = array[i + 6].split(split_pattern).last
    dd = array[i + 7].split(split_pattern).last
    puts "#{a}, #{aa}"
    puts "#{b}, #{bb}"
    puts "#{c}, #{cc}"
    puts "#{d}, #{dd}"
    puts
    i += 9 # This is a short way of writing i = i + 1
  end
end

rhyming_lines(snowy_lines, split_pattern)
