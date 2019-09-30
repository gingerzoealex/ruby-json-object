require_relative 'ckan_data_store.rb'

if __FILE__ == $0

  data = CkanDataStore.new
  puts data.get(1)
  # puts data.get

end
