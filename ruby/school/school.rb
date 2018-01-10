require 'pry'

class School
	def initialize(name)
		@name = name
		@db = {}
	end

	def add(student_name, student_grade)
		if @db[student_grade] == nil
			@db[student_grade] = []
		end

		@db[student_grade].push(student_name)
	end

	def db
		return @db
	end

	def grade(grade_num)
		return @db[grade_num]
	end

	def sort
		temp = @db.clone
		temp = temp.sort

		temp.each { |grade| 
			grade[1] = grade[1].sort
			p grade
		 }
		temp = temp.to_h
		return temp
	end
end

school = School.new("Haleakala Hippy School")
school.add("James", 2)
puts school.db

school.add("Blair", 2)
school.add("Jennifer", 3)
school.add("Little Billy", 1)
puts school.db

p school.grade(2)

p school.sort