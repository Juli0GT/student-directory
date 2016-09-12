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

def print(names)
  names.each do |name|
    puts "#{name[:name]} (#{name[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end


# Nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
