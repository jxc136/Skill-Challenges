class LetterCounter
  def initialize(text)
    @text = text
  end

  def calculate_most_common()
    counter = Hash.new
    most_common = nil
    most_common_count = 1
    @text.chars.each do |char|
      binding.irb
      next unless is_letter?(char)
      counter[char] = (counter[char] || 0 ) + 1
      binding.irb
      if counter[char] > most_common_count
        binding.irb
        most_common = char
        most_common_count = counter[char]
        binding.irb
      end
    end
    return [most_common_count, most_common]
  end

  private

  def is_letter?(letter)
    return letter =~ /[a-z]/i
  end
end

counter = LetterCounter.new("Digital Punk")
p counter.calculate_most_common

# Intended output:
# [2, "i"]

# What I did 

#   Hash had a default value of 1 - therefore hashes that were being seen 
#   for the first time were never being evaluated to nil or 0. 
#   To solve this I removed the default value for the counter hash and 
#   changed  counter[char] = (counter[char] || 1) + 1 to:
#   counter[char] = (counter[char] || 0) + 1