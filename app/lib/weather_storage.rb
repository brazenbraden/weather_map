class WeatherStorage
  include Singleton

  def add(weather_entity)
    @records[@id] = weather_entity
    @id += 1
  end

  def find(id)
    @records[id.to_i]
  end

  def all
    @records
  end

  def count
    @records.count
  end

  def empty
    @records = {}
    @id = 1
  end

  private

  def initialize
    @records = {}
    @id = 1
  end

end