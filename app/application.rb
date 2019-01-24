class Application 
  
  @@items = []
  
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new 
    
    if req.path.match == "/items/"
      item_name = req.path.split("/items/").last 
      if item = @@items.find{|i| i.name == item_name}
        resp.write item.price 
      else 
        resp.write "Item not found"
        resp.status = 400 
      end
    else 
      resp.write "Path not found"
      resp.status = 404
    end
    resp.finish 
  end
  
end