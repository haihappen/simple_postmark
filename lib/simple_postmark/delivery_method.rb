module Mail
  class SimplePostmark
    include HTTParty
    
    def initialize(values)
      self.settings = { api_key: '********-****-****-****-************' }.merge!(values)
    end
    
    attr_accessor :settings
    base_uri 'http://api.postmarkapp.com'
    headers 'Accept' => 'application/json', 'ContentType' => 'application/json'
    
    def deliver!(mail)
      self.class.post('/email', headers: self.class.headers.merge('X-Postmark-Server-Token' => settings[:api_key].to_s), body: mail.to_postmark.to_json)
    end
  end
end