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
    # output_hash_object
    # puts JSON.pretty_generate(@hash_object.fetch(1))


    # update_input_file

  end

  def output_hash_object
    # @hash_object.each_index { print @ , " -- " }
    @hash_object.each_index { puts JSON.pretty_generate(@hash_object) }
      # puts @hash_object[index]
  end

  def initialize(dataset_name = "dataset name", dataset_title = "dataset title")
  
    create_response
    @dataset_name = dataset_name
    @datatset_title = dataset_title
 
  end

  def get(*input)
    # puts JSON.pretty_generate(@hash_object.fetch(id))
    if input !=1
      puts JSON.pretty_generate(@hash_object.fetch(input))
      puts "If bloock"
      # puts JSON.pretty_generate(@hash_object)
    else
      puts "____________ \nChecking for index #{input}"
      # puts "Checking at index #{id}"
      # puts "Else block"

      puts JSON.pretty_generate(@hash_object.fetch(input))

      # puts JSON.pretty_generate(@hash_object.fetch(id))
      # 50a0f2ce-d93b-4f94-86b9-b1d183dcd447
      # puts @hash_object.index(id)
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

  def delete(key = 'key')
    # delete an object
    @hash_object.delete(key)
  end

  def update_input_file
    File.open('./input.json', 'w') do |f|
      f.write(@hash_object)
    end
  
  end

end # end of class

