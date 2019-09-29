require 'json'
require 'rest-client'

class CkanDataStore
  
  attr_accessor :dataset_name, :dataset_title, :data, :hash_object

  def create_response()
    # the ckan URL that will be used to return the response
    ckan_url = "demo.ckan.org/api/3/action/recently_changed_packages_activity_list"
    response = RestClient.get(ckan_url, headers={})

    obj = JSON.parse(response)
    data_hash = JSON.parse(response)
    @data = []
    @hash_object = data_hash['result'][0]['data']['package']

    obj.each do |hash|
      @data << @hash_object
    end
    puts @hash_object

    update_input_file

  end

  def initialize(dataset_name = "dataset name", dataset_title = "dataset title")
  
    create_response
    @dataset_name = dataset_name
    @datatset_title = dataset_title
 
  end

  def get(*name)
  
    puts "__"

    if name == ""
      puts @hash_object
    elsif
      # output =  @hash_object.each_key {|name|}
      output =  @hash_object
      puts output
    end

  end

  def post
    # create a new object
  end

  def put
    #update an object
  end

  def delete
    # delete an object
  end

  def update_input_file
    File.open('./input.json', 'w') do |f|
      f.write(@hash_object)
    end
  
  end

end # end of class

data = CkanDataStore.new()
puts "Getting data"
