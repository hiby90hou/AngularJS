# Enumerable.instance_methods
# => [:to_a, :to_h, :include?, :find, :entries, :sort, :sort_by, :grep, :grep_v, :
# count, :detect, :find_index, :find_all, :select, :reject, :collect, :map, :flat_
# map, :collect_concat, :inject, :reduce, :partition, :group_by, :first, :all?, :a
# ny?, :one?, :none?, :min, :max, :minmax, :min_by, :max_by, :minmax_by, :member?,
#  :each_with_index, :reverse_each, :each_entry, :each_slice, :each_cons, :each_wi
# th_object, :zip, :take, :take_while, :drop, :drop_while, :cycle, :chunk, :slice_
# before, :slice_after, :slice_when, :chunk_while, :lazy]

# Comparable.instance_methods
# => [:<, :>, :<=, :>=, :==, :between?]

# 将class变成comparable
class Person
	attr_reader :name
	include Comparable

	def initialize(name)
		@name = name
	end

	def <=> other
		self.name <=> other.name
	end
end

# 将class enumerable
class People
	attr_reader :people
	include Enumerable
	def initialize(people)
		@people = people
	end
	def each
		raise "please provide a block" unless block_given?
		people.each do |person|
			yield person
		end
	end
end