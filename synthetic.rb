class Person
	# 1
	attr_accessor :name, :age
	#3
	@@count = 0

	# 2
	def initialize(name, age)
		@name = name
		@age = age
		# 4
		@@count += 1
	end

	# 5
	def introduce
		puts "My name is #{@name}. I'm #{@age} years old"
	end

	# 6
	def self.total_count
		puts "Total number of people is #{@@count}"
	end

	# 17
	def method_with_exception
		begin
			raise StandardError, "Random message"
		rescue => e
			puts e.message
		end
	end
end

def debug(list_of_people)
	list_of_people.each {|person| person.introduce}
	puts "----------------"
end

# 7
people = []
20.times do |i|
	people.append(Person.new("Person#{i + 1}", rand(10..90)))
end
Person.total_count
debug people

# 8
people_less_than_18 = people.select {|person| person.age < 18}
debug people_less_than_18

# 9
people.reject! {|person| person.age < 18}
debug people

# 10
people.sort! {|lt, rt| lt.age <=> rt.age}
debug people

# 11
people.sort! {|lt, rt| rt.age <=> lt.age}
debug people

# 12
people.delete_at(2)
debug people

# 13
youngest = people.min {|lt, rt| lt.age <=> rt.age}
oldest = people.max {|lt, rt| lt.age <=> rt.age}
debug [youngest, oldest]

# 14
0...people.length {|i| people[i].age = people[i].age + 1}
debug people

people.each {|person| person.age = person.age + 1}
debug people

people = people.map {|person| person.age = person.age + 1; person}
debug people

# 15
ages = people.map {|person| person.age}
puts ages.inspect

# 16
people_2 = []
20.times do |i|
	people_2.append(Person.new("Person#{i + 1}", rand(10..90)))
end

people.concat(people_2)
debug people

# 17
people[20].method_with_exception