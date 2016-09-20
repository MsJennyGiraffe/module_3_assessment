class Store
  attr_reader :city, :distance, :name, :phone, :store_type

  def initialize(city, distance, name, phone, store_type)
    @city = city
    @distance = distance
    @name = name
    @phone = phone
    @store_type = store_type
  end

  def self.find_by_zipcode(zipcode)
    stores = BestBuyService.new.get_by_zipcode(zipcode)
    stores.map do |store|
      Store.new(
        store["city"],
        store["distance"],
        store["name"],
        store["phone"],
        store["storeType"]
      )
    end
  end
end
