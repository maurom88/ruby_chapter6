# review_file = File.open("reviews.txt")

# puts review_file.class

# lines = review_file.readlines
# puts "Line 4: #{lines[3]}"
# puts "Line 1: #{lines[0]}"

# review_file.close

lines = []
adjectives = []

File.open("reviews.txt") do |review_file|
    lines = review_file.readlines
end

relevant_lines = lines.find_all { |line| line.include?("Truncated") }
reviews = relevant_lines.reject { |line| line.include?("--") }

def find_adjective(string)
    words = string.split(" ")
    index = words.find_index("is")
    words[index + 1]
end

reviews.each do |review|
    adjectives << find_adjective(review)
end

puts adjectives