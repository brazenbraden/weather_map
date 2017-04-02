class WeatherMapper

  def self.map(result)
    result = result.with_indifferent_access
    @entity = WeatherEntity.new
    return @entity if result.empty?
    map_coords(result)
    map_weather(result)
    map_temp(result)
    map_icon(entity.weather[:icon])
    self
  end

  def self.entity
    @entity
  end

  private

  def initialize; end

  def self.map_coords(result)
    coord = result[:coord]
    entity.coords = {
      lat: coord[:lat],
      long: coord[:lon]
    }
  end

  def self.map_weather(result)
    weather = result[:weather].first
    entity.weather = {
      main: weather[:main],
      description: weather[:description],
      icon: weather[:icon]
    }
  end

  def self.map_temp(result)
    temp = result[:main]
    entity.temp = {
      current: temp[:temp],
      min: temp[:temp_min],
      max: temp[:temp_max],
      pressure: temp[:pressure],
      humidity: temp[:humidity]
    }
  end

  def self.map_icon(icon)
    entity.icon = "http://openweathermap.org/img/w/#{entity.weather[:icon]}.png"
  end

end