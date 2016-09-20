class BestBuyService
  def get_by_zipcode(zipcode)
    @conn = Faraday.new("https://api.bestbuy.com/v1/")
    response = @conn.get("stores(area(#{zipcode},25))?format=json&show=storeId,storeType,name,phone,city,distance&pageSize=25&apiKey=#{ENV['BEST_BUY_KEY']}")
    text = JSON.parse(response.body)["stores"]
  end
end
