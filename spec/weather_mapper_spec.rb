require 'active_support/core_ext/hash/indifferent_access'
require '../app/lib/weather_mapper'
require '../app/lib/weather_entity'

RSpec.describe WeatherMapper, 'class' do

  def example_data
    {"coord":{"lon":-0.13,"lat":51.51},"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02d"}],"base":"stations","main":{"temp":286.76,"pressure":1023,"humidity":51,"temp_min":285.15,"temp_max":288.15},"visibility":10000,"wind":{"speed":2.1},"clouds":{"all":20},"dt":1491139200,"sys":{"type":1,"id":5091,"message":0.0028,"country":"GB","sunrise":1491111124,"sunset":1491158200},"id":2643743,"name":"London","cod":200}
  end

  it 'should return an empty entity when no data is passed' do
    obj = WeatherMapper.map({})
    expect(obj).to be_an_instance_of WeatherEntity
  end

  context 'mapping data' do
    before(:all) do
      @entity = WeatherMapper.map(example_data).entity
    end

    it 'should return an entity after requesting it' do
      expect(WeatherMapper.map(example_data).entity).to be_an_instance_of WeatherEntity
    end

    it 'should map coordinates' do
      expect(@entity.coords.count).to eq 2
      expect(@entity.coords[:lat]).to eq 51.51
      expect(@entity.coords[:long]).to eq -0.13
    end

    it 'should map weather' do
      expect(@entity.weather.count).to eq 3
      expect(@entity.weather[:main]).to eq 'Clouds'
      expect(@entity.weather[:description]).to eq 'few clouds'
      expect(@entity.weather[:icon]).to eq '02d'
    end

    it 'should map temperature' do
      expect(@entity.temp.count).to eq 5
      expect(@entity.temp[:current]).to eq 286.76
      expect(@entity.temp[:min]).to eq 285.15
      expect(@entity.temp[:max]).to eq 288.15
      expect(@entity.temp[:humidity]).to eq 51
      expect(@entity.temp[:pressure]).to eq 1023
    end

    it 'should should have an icon url' do
      expect(@entity.icon).to eq 'http://openweathermap.org/img/w/02d.png'
    end
  end


end
