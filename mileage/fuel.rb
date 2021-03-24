require 'csv'
require './auto_seeker'

# content from data - array of arrays
data = CSV.read('foobarnian_autos.csv')

# Instance of data set - @data is an array of arrays
seeker = AutoSeeker.new data

# Array of instances with @color @price @mileage @fuel where the color matches the user input in the CL
autos = seeker.filter(:fuel, ARGV[0])

if autos.length == 0
  abort "no autos with fuel type #{ARGV[0]} found"
end

car_number = AutoSeeker.fuel_filter(autos)

puts "There are #{car_number} cars that are use #{ARGV[0]} for fuel"
