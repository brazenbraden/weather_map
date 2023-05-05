class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @entity = load_entity(1) || GetWeatherUsecase.new.execute('wc', 'uk')
  end

  def search
    begin
      @entity = GetWeatherUsecase.new.execute(params[:zip], 'uk')
    rescue RestClient::ExceptionWithResponse => e
      flash.now[:danger] = "Something went wrong. Error: #{e.message}"
      @entity = load_entity(1)
    end
    render :index
  end

  def load
    @entity = load_entity(params[:q])
    render :index
  end

  private

  def load_entity(id)
    WeatherStorage.instance.find(id)
  end

end
