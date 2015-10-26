require "./Dictmodule.rb"

# create a mapping of state to abbreviation

states = Dict.new()

 Dict.set(states,"Oregon","OR")
 Dict.set(states,"Florida","FL")
 Dict.set(states,"California","CA")
 Dict.set(states,"New York", "NY")
 Dict.set(states, "Michigan", "MI")


# Create a basic set of states and their corresponding cities in them

cities = Dict.new()
 Dict.set(cities,"CA","San Francisco")
 Dict.set(cities, "MI", "Detroit")
 Dict.set(cities,"FL", "Jacksonville")
# Add some more cities,

Dict.set(cities,"NY","New York")
Dict.set(cities,"OR","Portland")
# puts out some cities

puts "_" * 10
puts "NY state has #{Dict.get(cities,"NY")}"
puts "OR state has #{Dict.get(cities,"OR")}"

# puts some states out
puts "_" * 10
puts "California's abbreviation is  #{Dict.get(states,"California")}"
puts "Michigan's abbreviation is  #{Dict.get(states, "Michigan")}"

#put some cities out by using the state and cities dictionary

puts "_" * 10
puts "Oregons's city is from #{Dict.get(cities,Dict.get(states,"Oregon"))}"
puts "Michigan's city is from #{Dict.get(cities,Dict.get(states,"Michigan"))}"

#puts every state abbreviation

puts "_" * 10
Dict.list(states)

#Puts every city in state

puts "_" * 10
Dict.list(cities)


#by default ruby puts out nil if something doesnt exist within a hash map

state = Dict.get(states,"Texas")

if !state
	puts "sorry theres no texas"
end

city = Dict.get(cities,"TX","Does Not Exist")
puts "The city for the state abbreviation TX is #{city}"
