require_relative 'ckan_data_store.rb'

class UseData
  attr_accessor :data_store

  def initialize()
    #init vars
    @data_store = CkanDataStore.new
  end

  def get
    #get the objects
    @data_store.get
  end

  def create_object
    #create an object
  end

  def delete_object
    # delete object
  end

  def search_name(data_store, value)
    # search with a dataset name with optional params
    puts "Checking for the name"
    # puts @data_store.get(value)
    
  end
  
  def update_object
    #alter an object's fields
  end

end

if __FILE__ == $0

  data = UseData.new
  # puts data.get

end
