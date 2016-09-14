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

interactive_menu
