require './auto'

class AutoSeeker

  def initialize data
    @data = data
  end

  def filter key, match
    @autos = autos.select do |auto|
      auto.send(key) == match
    end
  end

  def filter_price key, match
    p key, match.to_a
    p autos.mileage
    @autos = autos.select do |auto|
      p auto.select { |c| match === key }
    end
  end

  def autos
    @autos ||= @data.map do |row|
      Auto.new(row)
    end
  end

  def self.median_mileage autos
    # Removes nil values from the milage data set using compact
    prices = autos.collect(&:mileage).compact.sort
    (prices[(prices.length - 1) / 2].to_f + prices[prices.length / 2].to_f) / 2.0
  end

  def self.fuel_filter autos
    autos.collect(&:color).compact.length
  end

  def self.price_range autos
    p autos.each { |c| c.price }
    car_number = autos.collect(&:price).compact.sort
    car_number.length
  end

end
