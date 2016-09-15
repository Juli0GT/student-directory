

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

# Exercise 3
def print_shorter_12(names)
  names.each do |name|
    puts "The students whose name have less than 12 characters are: "
    if (name[:name]).length < 12
      puts "#{name[:name]} (#{name[:cohort]} cohort)"
    end
  end
end

# Exercise 4
def print_while(names)
  while !names.empty? do
    names.each do |name|
      puts "#{name[:name]} (#{name[:cohort]} cohort)"
    end
    break names.empty?
  end
end

# Exercise 5
def input_students_keys
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students.each do |name|
    name[:hobby] = "coding"
    name[:country_birth] = "Spain"
    name[:food] = "paella"
  end
  students
end

def print_indexed_keys(names)
  names.each.with_index(1) do |name, i|
    print "#{i}. #{name[:name]} (#{name[:cohort]} cohort) is from #{name[:country_birth]}"
    puts " loves #{name[:hobby]} and #{name[:food]}."
  end
end

# Exercise 6
def print_header_center(names)
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

# Exercise 7
def input_students_cohort
  puts "Please enter the names and cohort of the students"
  puts "To finish, just hit return twice"
  students = []
  puts "Enter the name"
  name = gets.chomp
  puts "Now enter the cohort"
  cohort = gets.chomp
  if cohort.empty?
    cohort = :November
  end
  cohort = :"#{cohort}"
  puts "#{name} (#{cohort} cohort)"
  puts "In case that's wrong, please press 'n'"
  correct = gets.chomp

  while correct.capitalize == "N"
    puts "Please enter again your name"
    name = gets.chomp
    puts "Now enter your cohort"
    cohort = gets.chomp
    if cohort.empty?
      cohort = "november"
    end
    cohort = :"#{cohort}"
    puts "#{name} (#{cohort} cohort)"
    puts "In case that's wrong, please press 'n'"
    correct = gets.chomp
  end
  puts "Right #{name} you have been assigned to #{cohort} cohort"
  while !name.empty? do
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    puts "Enter a new name"
    name = gets.chomp
    if !name.empty?
      puts "And now the cohort"
      cohort = gets.chomp
      if cohort.empty?
        cohort = :November
      end
      cohort = :"#{cohort}"
      puts "#{name} (#{cohort} cohort)"
      puts "In case that's wrong, please press 'n'"
      correct = gets.chomp
      while correct.capitalize == "N"
        puts "Please enter again your name"
        name = gets.chomp
        puts "Now enter your cohort"
        cohort = gets.chomp
        if cohort.empty?
          cohort = "november"
        end
        cohort = :"#{cohort}"
        puts "#{name} (#{cohort} cohort)"
        puts "In case that's wrong, please press 'n'"
        correct = gets.chomp
      end
      puts "Right #{name} you have been assigned to #{cohort} cohort"
    end
  end
  students.each do |name|
    name[:hobby] = "coding"
    name[:country_birth] = "Spain"
    name[:food] = "paella"
  end
end

# Exercise 8
def print_by_cohort(names)
  puts "Which cohort are you interested in?"
  cohort = gets.chomp
  cohort = :"#{cohort}"
  puts "The students form the #{cohort} cohort are :"
  names.select do |name|
    if name[:cohort] == cohort.capitalize
      print "#{name[:name]} from #{name[:country_birth]}"
      puts " loves #{name[:hobby]} and #{name[:food]}."
    end
  end
end

# Exercise 9
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
    if students.size == 1
      puts "Now we have #{students.count} student."
    else
      puts "Now we have #{students.count} students."
    end
    # Get another name from the user
    name = gets.chomp
  end
  # Return the array of students
  students
end

# Exercise 10
# .chomp() == delete("\n") ==.tr("\n", "") == .gsub("\n", "")
puts "What's your name?"
name = gets.delete("\n")

# Exercise 12
def print_header_center_empty(names)
  if names.size > 0
    puts "The students of Villains Academy".center(50)
    puts "-------------".center(50)
  end
end

def print_indexed_keys_empty(names)
  if names.size > 0
    names.each.with_index(1) do |name, i|
      print "#{i}. #{name[:name]} (#{name[:cohort]} cohort) is from #{name[:country_birth]}"
      puts " loves #{name[:hobby]} and #{name[:food]}."
    end
  end
end

def print_by_cohort_empty(names)
  if names.size > 0
    puts "Which cohort are you interested in?"
    cohort = gets.chomp
    cohort = :"#{cohort}"
    puts "The students form the #{cohort} cohort are :"
    names.select do |name|
      if name[:cohort] == cohort.capitalize
        print "#{name[:name]} from #{name[:country_birth]}"
        puts " loves #{name[:hobby]} and #{name[:food]}."
      end
    end
  end
end

def print_footer_empty(names)
  if names.size > 0
    puts "Overall, we have #{names.count} great students"
  end
end

# I've done step 9-10  in another file which is also uploaded to github called
# interactive_menu.rb

# Step 11 "Saving the data to a file"

@students = []

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      # input the students
      input_students
    when "2"
      # show the students
      show_students
    when "3"
      # save the list to students.csv
      save_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names and cohort of the students"
  puts "To finish, just hit return twice"
  puts "Enter the name"
  name = gets.chomp
  puts "Now enter the cohort"
  cohort = gets.chomp
  if cohort.empty?
    cohort = :November
  end
  cohort = :"#{cohort}"
  puts "#{name} (#{cohort} cohort)"
  puts "In case that's wrong, please press 'n'"
  correct = gets.chomp

  while correct.capitalize == "N"
    puts "Please enter again your name"
    name = gets.chomp
    puts "Now enter your cohort"
    cohort = gets.chomp
    if cohort.empty?
      cohort = "november"
    end
    cohort = :"#{cohort}"
    puts "#{name} (#{cohort} cohort)"
    puts "In case that's wrong, please press 'n'"
    correct = gets.chomp
  end
  while !name.empty? do
    @students << {name: name, cohort: cohort}
    if @students.size == 1
      puts "Now we have #{@students.count} student:"
    else
      puts "Now we have #{@students.count} students:"
    end
    puts "#{name} has been added to #{cohort} cohort."
    puts "Enter a new name"
    name = gets.chomp
    if !name.empty?
      puts "And now the cohort"
      cohort = gets.chomp
      if cohort.empty?
        cohort = :November
      end
      cohort = :"#{cohort}"
      puts "#{name} (#{cohort} cohort)"
      puts "In case that's wrong, please press 'n'"
      correct = gets.chomp
      while correct.capitalize == "N"
        puts "Please enter again your name"
        name = gets.chomp
        puts "Now enter your cohort"
        cohort = gets.chomp
        if cohort.empty?
          cohort = "november"
        end
        cohort = :"#{cohort}"
        puts "#{name} (#{cohort} cohort)"
        puts "In case that's wrong, please press 'n'"
        correct = gets.chomp
      end
      puts "Right #{name} you have been assigned to #{cohort} cohort"
    end
  end
  @students.each do |name|
    name[:hobby] = "coding"
    name[:country_birth] = "Spain"
    name[:food] = "paella"
  end
end

def show_students
  print_header(@students)
  print_students_list(@students)
  print_footer(@students)
end


def print_header(names)
  if names.size > 0
    puts "The students of Villains Academy".center(50)
    puts "-------------".center(50)
  end
end


def print_students_list(names)
  if names.size > 0
    names.each.with_index(1) do |name, i|
      print "#{i}. #{name[:name]} (#{name[:cohort]} cohort) is from #{name[:country_birth]}"
      puts " loves #{name[:hobby]} and #{name[:food]}."
    end
  end
end

def print_cohort(names)
  if names.size > 0
    puts "Which cohort are you interested in?"
    cohort = gets.chomp
    cohort = :"#{cohort}"
    puts "The students form the #{cohort} cohort are :"
    names.select do |name|
      if name[:cohort] == cohort.capitalize
        print "#{name[:name]} from #{name[:country_birth]}"
        puts " loves #{name[:hobby]} and #{name[:food]}."
      end
    end
  end
end

def print_footer(names)
  if names.size > 0
    puts
    puts "Overall, we have #{names.count} great students".center(50)
    puts
  end
end

def save_students
  # Open the file for writing
  file = File.open("students.csv", "w")
  # Iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

touch .gitignore
