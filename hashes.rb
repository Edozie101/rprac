

# create a mapping of state to abbreviation

states = {

 "Oregon" => 'OR',
 "Florida" => 'FL',
 "California" => 'CA',
 "New York" => "NY",
 "Michigan" => "MI"
}

# Create a basic set of states and their corresponding cities in them

cities = {
   "CA" => 'San Francisco',
   'MI' => "Detroit",
   "FL" => "Jacksonville"
 }

# Add some more cities,

cities["NY"] = "New York"
cities["OR"] = "Portland"

# puts out some cities

puts "_" * 10
puts "NY state has #{cities["NY"]}"
puts "OR state has #{cities["OR"]}"

# puts some states out
puts "_" * 10
puts "California's abbreviation is  #{states["California"]}"
puts "Michigan's abbreviation is  #{states["Michigan"]}"

#put some cities out by using the state and cities dictionary

puts "_" * 10
puts "Oregons's city is from #{cities[states["Oregon"]]}"
puts "Michigan's city is from #{cities[states["Michigan"]]}"

#puts every state abbreviation

puts "_" * 10
cities.each do |abbrv,city|
	puts "#{abbrv} has the city:  #{city}"
end

#now put the city and the state name at the same time

puts "_" * 10
states.each do |state,abbrv|
	city = cities[abbrv]
        puts " #{state} has the abbreviation #{abbrv} and has the city #{city}"
end

#by default ruby puts out nil if something doesnt exist within a hash map

state = states["Texas"]

if !state
	puts "sorry theres no texas"
end

city = cities["TX"]
city ||= "Does not exist"

puts "The city for the state abbreviation TX is #{city}"
