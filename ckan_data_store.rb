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
    @data = Hash.new("respsonse")
    # puts "loop x#{count}"
    @hash_object = obj['result']
    @data = @hash_object
    # set the ID to the index?
    puts "Object created: "
    puts @hash_object.class
    puts data.class

    update_input_file

  end

  def output_hash_object
    @hash_object.each_index { puts JSON.pretty_generate(@hash_object) }
  end

  def initialize(dataset_name = "dataset name", dataset_title = "dataset title")
  
    create_response
    @dataset_name = dataset_name
    @datatset_title = dataset_title

  end

  def get(input=nil)
    # puts JSON.pretty_generate(@hash_object.fetch(id))
    if input.is_a?(Integer)
      puts "Object at index [#{input}]"
      puts JSON.pretty_generate(@hash_object.at(input))
    else
      puts "Showing all objects"
      output_hash_object
    end

  end

  def post(new_object_data)
    # create a new object
    new_object = []
    @data_store << new_object
  end

  def put
    #update an object
  end

  def delete(id)
    # delete an object
    puts get(id)
    puts "DELETING ITEM"
    @hash_object.delete(id)
  end

  def update_input_file
    File.open('./input.json', 'w') do |f|
      f.write(@hash_object)
    end

  end

end # end of class

