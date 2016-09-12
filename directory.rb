# Let's put all students into a hash.
# Hashes have keys corrsponding to values, so instead of referencing the data by index
# as we have done with arrays (student[0]), we can reference them by key

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # Create and empty array
  students = []
  # Get the first name
  name = gets.chomp
  # While the name is not empty, repeat this code
  while !name.empty? do
    # Add the student hash, to the array students
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # Get another name from the user
    name = gets.chomp
  end
  # Return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# Exercise 1
def print_indexed(names)
  names.each.with_index(1) do |name, i|
    puts "#{i}. #{name[:name]} (#{name[:cohort]} cohort)"
  end
end

# Exercise 2
def print_beginning_with(names)
  puts "Which initial are you interested in?"
  letter = gets.chomp
  names.each do |name|
    puts "The students whose initial is #{letter.capitalize} are: "
    if (name[:name])[0] == letter.capitalize
      puts "##{name[:name]} (#{name[:cohort]} cohort)"
    end
  end
end





# Nothing happens until we call the methods
students = input_students
print_shorter_12(students)
print_footer(students)
