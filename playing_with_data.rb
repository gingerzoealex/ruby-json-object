require_relative 'ckan_data_store.rb'

if __FILE__ == $0

  data = CkanDataStore.new
  input_string = "string"
  input_null = ""
  input_int = 4
  input_double = 1.7
  # puts data.get(input_double)
  puts data.get(input_int)
  # puts data.get

end
