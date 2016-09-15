# Final solution before exercises:
@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "5. To select an sepecific cohort"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
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
      print "Please, introduce the name of the file where you will save your students list"
      puts "Remember that it need to have an .csv extension"
      filename = gets.chomp
      save_students(filename)
    when "4"
      puts "Please, introduce the name of the file to load the students list:"
      filename = gets.chomp
      load_students(filename)
    when "5"
      print_cohort
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end


def input_students
  puts "Please enter the name and cohort of the students"
  puts "To finish, just hit return twice"
  puts "Enter the name"
  name = STDIN.gets.chomp
  puts "Now enter the cohort"
  cohort = STDIN.gets.chomp
  nov_cohort(cohort)
  correct_entry?(name, cohort)
  while !name.empty? do
    introduce_students(name, cohort)
    if @students.size == 1
      puts "Now we have #{@students.count} student:"
    else
      puts "Now we have #{@students.count} students:"
    end
    puts "#{name} has been added to #{cohort} cohort."
    puts "Enter a new name"
    name = STDIN.gets.chomp
    if !name.empty?
      puts "Now enter the cohort"
      cohort = STDIN.gets.chomp
      nov_cohort(cohort)
      correct_entry?(name, cohort)
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
  print_header
  print_students_list
  print_footer
end

def print_header
  if @students.size > 0
    puts "The students of Villains Academy".center(50)
    puts "-------------".center(50)
  end
end

def print_students_list
  if @students.size > 0
    @students.each.with_index(1) do |name, i|
      print "#{i}. #{name[:name]} (#{name[:cohort]} cohort) is from #{name[:country_birth]}"
      puts " loves #{name[:hobby]} and #{name[:food]}."
    end
  end
end

def print_cohort
  if @students.size > 0
    puts "Which cohort are you interested in?"
    cohort = STDIN.gets.chomp.to_sym
    puts "The students form the #{cohort} cohort are :"
    @students.select do |name|
      if name[:cohort] == cohort.capitalize
        print "#{name[:name]} from #{name[:country_birth]}"
        puts " loves #{name[:hobby]} and #{name[:food]}."
      end
    end
  end
end

def print_footer
  if @students.size > 0
    puts
    puts "Overall, we have #{@students.count} great students".center(50)
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


def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    introduce_students(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    load_students("students.csv")
  else
    if File.exists?(filename) # if it exists
      load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
    else # if it doesn't exist
      puts "Sorry, #{filename} doesn't exist."
      exit
    end
  end
end

# Exercise 1
def introduce_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

# Exercise 2
def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    load_students("students.csv")
  else
    if File.exists?(filename) # if it exists
      load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
    else # if it doesn't exist
      puts "Sorry, #{filename} doesn't exist."
      exit
    end
  end
end

# Exercise 3

def correct_entry?(name, cohort)
  puts "#{name} (#{cohort} cohort)"
  puts "In case that's wrong, please press 'n'"
  correct = STDIN.gets.chomp
  while correct.capitalize == "N"
    puts "Please enter again your name"
    name = STDIN.gets.chomp
    puts "Now enter your cohort"
    cohort = STDIN.gets.chomp
    if cohort.empty?
      cohort = "November"
    end
    correct_entry(name, cohort)
  end
end

def nov_cohort(cohort)
  if cohort.empty?
    cohort = :November
  end
end

def input_students
  puts "Please enter the name and cohort of the students"
  puts "To finish, just hit return twice"
  puts "Enter the name"
  name = STDIN.gets.chomp
  puts "Now enter the cohort"
  cohort = STDIN.gets.chomp
  nov_cohort(cohort)
  correct_entry?(name, cohort)
  while !name.empty? do
    introduce_students(name, cohort)
    if @students.size == 1
      puts "Now we have #{@students.count} student:"
    else
      puts "Now we have #{@students.count} students:"
    end
    puts "#{name} has been added to #{cohort} cohort."
    puts "Enter a new name"
    name = STDIN.gets.chomp
    if !name.empty?
      puts "Now enter the cohort"
      cohort = STDIN.gets.chomp
      nov_cohort(cohort)
      correct_entry?(name, cohort)
      puts "Right #{name} you have been assigned to #{cohort} cohort"
    end
  end
  @students.each do |name|
    name[:hobby] = "coding"
    name[:country_birth] = "Spain"
    name[:food] = "paella"
  end
end

# Exercise 4
def load_students
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    introduce_students(name, cohort)
  end
  file.close
  puts "Your students list has been loaded successfully"
end

def save_students
  print "Introduce the name of the file where you will save your students list"
  puts "Remember that it need to have an .csv extension"
  filename = gets.chomp
  file = File.open(filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Your students list has been saved successfully on #{filename}."
end

# Exercise 5

def process(selection)
  case selection
    when "1"
      # input the students
      input_students
    when "2"
      # show the students
      show_students
    when "3"
      print "Please, introduce the name of the file where you will save your students list"
      puts "Remember that it need to have an .csv extension"
      filename = gets.chomp
      save_students(filename)
    when "4"
      puts "Please, introduce the name of the file to load the students list:"
      filename = gets.chomp
      load_students(filename)
    when "5"
      print_cohort
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def save_students(filename)
  file = File.open(filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Your students list has been saved successfully on #{filename}."
end


def load_students(filename)
  if !File.exists?(filename)
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    introduce_students(name, cohort)
  end
  file.close
  puts "Your students list has been loaded successfully"
end




try_load_students
interactive_menu
