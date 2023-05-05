class GetWeatherUsecase

  def execute(zip, code)
    # Fetch weather
    zip_with_code = [zip, code].join(',')
    response = OpenWeatherMap.new
                             .add_options(q: zip_with_code)
                             .execute

    entity = WeatherMapper.map(response).entity

    # Update weather entity with location information and icon url
    entity.location = zip_with_code

    # Save weather entity into storage
    WeatherStorage.instance.add(entity)

    # Return weather entity
    entity
  end

end