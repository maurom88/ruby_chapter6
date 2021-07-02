# review_file = File.open("reviews.txt")

# puts review_file.class

# lines = review_file.readlines
# puts "Line 4: #{lines[3]}"
# puts "Line 1: #{lines[0]}"

# review_file.close

lines = []

File.open("reviews.txt") do |review_file|
    lines = review_file.readlines
end

relevant_lines = lines.find_all { |line| line.include?("Truncated") }

puts relevant_lines