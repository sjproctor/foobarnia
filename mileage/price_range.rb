require 'csv'
require './auto_seeker'

# content from data - array of arrays
data = CSV.read('foobarnian_autos.csv')

# Instance of data set - @data is an array of arrays
seeker = AutoSeeker.new data

# Array of instances with @color @price @mileage @fuel where the color matches the user input in the CL
autos = seeker.filter_price(:price, ARGV[0])

if autos.length == 0
  abort "no autos with #{ARGV[0]} price found"
end

cars = AutoSeeker.price_range(autos)

puts "There are #{cars} in this price range"
