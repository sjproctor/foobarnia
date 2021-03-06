require 'csv'
require './auto_seeker'

# content from data - array of arrays
data = CSV.read('foobarnian_autos.csv')

# Instance of data set - @data is an array of arrays
seeker = AutoSeeker.new data

# Array of instances with @color @price @mileage @fuel where the color matches the user input in the CL
autos = seeker.filter(:color, ARGV[0])

if autos.length == 0
  abort "no autos with color #{ARGV[0]} found"
end

mileage = AutoSeeker.median_mileage(autos)

puts "median mileage = #{mileage} MPG"
