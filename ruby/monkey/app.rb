require_relative 'monkey'

adam = Monkey.new("Adam", "Spider Monkey")
adam.eat('fruit salad')
adam.eat('banana milkshake')
adam.eat('banana')
adam.introduce # "Hi my name is Adam. I am a Spider Monkey. I had fruit salad and banana milkshake for brunch"