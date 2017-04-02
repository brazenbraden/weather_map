require 'singleton'
require '../app/lib/weather_storage'

RSpec.describe WeatherStorage, 'class' do

  def example_object(field)
    {
      text: field
    }
  end

  before(:each) do
    @store = WeatherStorage.instance
    @store.empty
  end

  it 'should save an object' do
    @store.add(example_object('foo'))
    expect(@store.count).to eq 1
  end

  it 'should delete all stored objects' do
    @store.add(example_object('foo'))
    @store.add(example_object('bar'))
    expect(@store.count).to eq 2
    @store.empty
    expect(@store.count).to eq 0
  end

  it 'should be able to retrieve an object by id' do
    obj = example_object('foo')
    @store.add(obj)
    expect(@store.find(1)).to eq obj
  end

  it 'should retrieve all stored objects' do
    @store.add(example_object('foo'))
    @store.add(example_object('bar'))
    expect(@store.all.count).to eq 2
  end

end