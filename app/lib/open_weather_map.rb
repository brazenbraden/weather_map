class OpenWeatherMap

  def initialize
    @url = 'http://api.openweathermap.org/data/2.5/weather'
    @options = {
      APPID: Rails.application.secrets.open_weather_api_key
    }
  end

  def execute
    request_params = {
      url: @url,
      method: :post,
      headers: {
        params: @options
      }
    }

    response = RestClient::Request.execute(request_params)
    JSON.parse(response)
  end

  def add_options(options = {})
    @options.merge!(options)
    self
  end

end