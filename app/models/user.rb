class User < ActiveRecord::Base
    
    def self.create_user! (inputHash) 
       inputHash[:session_token] = SecureRandom.base64 
       self.create!(inputHash)
    end
end
