module Requests  
  module JsonHelpers
    def json
      JSON.parse(response.body) rescue {}
    end
  end
end 