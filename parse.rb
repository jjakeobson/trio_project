module Parse
    require 'httparty'
    require 'json'
    
    url = "https://openapi.etsy.com/v2/listings/active?api_key=6f6yhx4dfbj6q0hugfla5bur&includes=Images"
    response = HTTParty.get(url).body
    @body = JSON.parse(response)
    
    def self.get_var(var)
        results = @body.fetch("results")
        thing = results[0]["#{var}"]
    end
    def self.get_img(size)
        results = @body.fetch("results")
        puts results.first["Images"].first[size]
    end
end

#p Parse.get_var("Images")
Parse.get_img("url_fullxfull")