puts "#LOOPS"
puts "------"
groceries = ["bananas", "sweet potatoes", "pasta", "tomatoes"]

groceries.each do |food|
    puts "Get some #{food}."
end

(0..5).each do |i| #range from 0 to 5
    puts "#{i},"
end

#functions
puts "#FUNCTIONS"
puts "----------"

def add_nums(num_1, num_2)
    return num_1.to_i +  num_2.to_i #.to_i ==  to integer
end
puts add_nums(3, 4)

x = 1
def change_x(x)
    x = 4
end
change_x(x)
puts"x = #{x}" 

puts "============="

print "Enter a number: "
first_num = gets.to_i #convert string to integer
print "Enter another number: "
second_num = gets.to_i
begin
    answer = first_num / second_num
rescue => exception
    puts "You can't divide by zero"
    exit
end
puts "The division of #{first_num} and #{second_num} is #{answer}"

puts "============="

age = 12
def check_age(age)
    raise ArgumentError, "Enter positive number" unless age > 0
end
begin
    check_age(-1)
rescue ArgumentError
    puts "That's an impossible age"
end

puts "============="

puts "Add them #{4 + 5} \n\n"
puts 'Add them #{4 + 5} \n\n'

puts "============="

puts "----------"
puts "#STRINGS"
puts "----------"

first_name = "Derek"
last_name = "Banas"
full_name = "Hello, #{first_name} #{last_name}."

puts full_name
puts full_name.size
puts full_name.include?("stephan")
puts "Vowels: " + full_name.count("aeiou").to_s
puts "Consonants: " + full_name.count("^aeiou").to_s
puts full_name.start_with?"Banas"
puts "LastName index: " + full_name.index("Banas").to_s
puts full_name.upcase
puts full_name.downcase
puts full_name.swapcase

puts "============="
puts full_name.chop #cuts off the last char
puts full_name.chomp("as.") #cuts off the last chars based off of str input

puts full_name.delete("a") #delete all "a" chars
name_array = full_name.split(//) #split on every char
puts name_array

name_array = full_name.split(/ /) #splits on every space
puts name_array

puts "============="
#to_i  int conversion
#to_f  float conversion
#to_sym  to sumbol

puts "----------"
puts "#OBJECTS"
puts "----------"

class Animal
    def initialize
        puts "Creating a new animal"
    end

    def set_name(new_name)
        @name = new_name
    end

    def get_name
        @name
    end

    def name
        @name
    end

    def name=(new_name)
        if new_name.is_a?(Numeric)
            puts "Name can't be a number"
        else
            @name = new_name
        end
    end
end

cat = Animal.new

cat.set_name ('Peekaboo')
puts cat.get_name
puts cat.name

cat.name = "Sophie"
puts cat.name

class Dog
    #attr_reader :name, :height, :weight #getter functions
    #attr_writer :name, :height, :weight #setter functions
    attr_accessor :name, :height, :weight #combined get and set functions

    def bark
        return "generic bark"
    end
end

rover = Dog.new
rover.name = "Rover"
rover.height = 28
rover.weight = 50
puts "Your dog's name is #{rover.name}, he is #{rover.height} inches tall and weighs #{rover.weight} lbs!"

class GermanShephard < Dog # inherits from Dog class
    def bark
        return "loud bark"
    end
end

max = GermanShephard.new
max.name = "Max"
puts "#{max.name}'s bark is a #{max.bark}!"

# %s = strings
# %d = integers
# %f = floats
# %.3f = float w. 3 decimals
printf "%s has a %s \n", max.name, max.bark 

puts "--------"
puts "#MODULES"
puts "--------"

require_relative "human"
require_relative "smart"

class Scientist
    include Human
    prepend Smart # PREPEND means it's going to use the included module, not that which is defined below
    
    def act_smart
        return "Eureka"
    end
end

einstein = Scientist.new

einstein.name = "Albert"
puts einstein.name
einstein.run
puts einstein.name + " says " + einstein.act_smart

puts "-------------"
puts "#POLYMORPHISM"
puts "-------------"

class Bird
    def tweet(bird_type)
        bird_type.tweet
    end
end

class Cardinal < Bird
    def tweet
        puts "tweet tweet"
    end
end

class Parrot < Bird
    def tweet
        puts "Squawk"
    end
end

generic_bird = Bird.new
generic_bird.tweet(Cardinal.new)
generic_bird.tweet(Parrot.new)

puts "--------"
puts "#SYMBOLS"
puts "--------"
# string who's value cannot be changed/no access to string methods(mainly for keys inside of hashes)
## Conserve memory
### Speed up string comparison

puts :derek
puts :derek.to_s
puts :derek.class
puts :derek.object_id

puts "-------"
puts "#ARRAYS"
puts "-------"

array_1 = Array.new
array_2 = Array.new(5) #amount of slots = 5
array_3 = Array.new(5, "empty") # empty is the default value given here
array_4 = [1, "two", 3, 5.5]

puts array_4[2,2].join(", ")
puts array_4.values_at(0, 1, 3).join(", ")

array_4.unshift(-1) # add in front of first item in the array
puts array_4.join(", ")

array_4.shift() # remove first item in array
puts array_4.join(", ")

array_4.push(7, 8) # add to the end of an array
puts array_4.join(", ")

array_4.pop() # remove one item from the end of the array
puts array_4.join(", ")

array_4.concat([10,20,30])
puts array_4.join(", ")

puts "Array Size: " + array_4.size().to_s
puts "Array Contains 100: " + array_4.include?(100).to_s
puts "How many 100's: " + array_4.count(100).to_s
puts "Array empty: " + array_4.empty?.to_s

p array_4 # p print out entire array to screen
array_4.each do |value|
    puts value
end

puts "-------"
puts "#HASHES"
puts "-------"
# collection of key/value pairs

number_hash = {"PI" => 3.14,
               "Golden" => 1.618,
               "e" => 2.718}

puts number_hash["PI"]

superheroes = Hash["Clark Kent", "Superman", "Bruce Wayne", "Batman"]

puts superheroes["Bruce Wayne"]
superheroes["Barry Allen"] = "Flash" # adding a new key/value

puts superheroes["Barry Allen"]

samp_hash = Hash.new("No Such Key") # default value (in case the key the entered doesn't exist)
puts samp_hash["dog"]

superheroines = Hash["Lisa Morel", "Aquagirl", "Betty Kane", "Batgirl"]

superheroes.update(superheroines) #update is a destructive merge, duplicates will be eliminated!!!
superheroes.merge(superheroines) #merge is a NON-destructive merge

puts superheroes["Betty Kane"]

puts "======================="

superheroes.each do |key, value|
    puts key.to_s + " : " + value
end

puts "size of hash before deletion: " + superheroes.size.to_s
superheroes.delete("Barry Allen") #delete key
puts "size of hash after deletion: " + superheroes.size.to_s

puts "------------"
puts "#ENUMERABLES"
puts "------------"

class Menu
    include Enumerable

    def each
        yield "pizza"
        yield "spaghetti"
        yield "salad"
        yield "water"
        yield "bread"
    end
end

menu_options = Menu.new
menu_options.each do |item|
    puts "would you like : #{item}?"
end

p menu_options.find{|item| item = "pizza"}

p menu_options.select{|item| item.size <= 5}

p menu_options.reject{|item| item.size <= 5}

p menu_options.first # first item

p menu_options.take(2) # first x items

p menu_options.drop(2) # drop the first x amount of items

p menu_options.sort # sorted alphabetically

puts "------"
puts "#FILES"
puts "------"

file = File.new("authors.out", "w") # created a new file, with first file name and then write permission after

file.puts "William Shakespeare"
file.puts "Agatha Christie"
file.puts "Neal Stephenson"

file.close

puts File.read("authors.out")

file = File.new("authors.out", "a") #append to file
file.puts "Douglas Coupland"
file.close

puts File.read("authors.out")

file = File.new("authors_info.out", "w")
